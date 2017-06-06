require 'rails_helper'

describe CuepointsController do

  describe 'Get #index' do
    before do
      @test1 = create(:cuepoint, name: "test1")
      @test2 = create(:cuepoint, name: "test2")
      get 'index'
    end
    it 'リクエストは200 OKとなること'  do
      expect(response.status).to eq 200
    end
    it '@cuepointsに全てのユーザーを割り当てること' do
      expect(assigns(:cuepoints)).to match_array([@test1,@test2])
    end
    it ':indexテンプレートを表示すること' do
      expect(response).to render_template :index
    end
  end

  describe 'Get #new' do
    before do
      get :new
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it '@cuepointに新しいユーザーを割り当てること' do
      expect(assigns(:cuepoint)).to be_a_new(Cuepoint)
    end
    it ':newテンプレートを表示すること' do
      expect(response).to render_template :new
    end
  end

  describe 'Get #edit' do
    before do
      @cuepoint = create(:cuepoint)
      get 'edit', id: @cuepoint.id
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it '@cuepointに要求されたユーザーを割り当てること' do
      expect(assigns(:cuepoint)).to eq @cuepoint
    end
    it ':editテンプレートを表示すること' do
      expect(response).to render_template :edit
    end
  end

  describe 'Post #create' do
    context '有効なパラメータの場合' do
      before do
        @cuepoint = attributes_for(:cuepoint)
      end
      it 'リクエストは302 リダイレクトとなること' do
        post :create, cuepoint: @cuepoint
        expect(response.status).to eq 302
      end
      it 'データベースに新しいユーザーが登録されること' do
        expect{
          post :create, cuepoint: @cuepoint
        }.to change(Cuepoint, :count).by(1)
      end
      it 'cuepoints_pathにリダイレクトすること' do
        post :create, cuepoint: @cuepoint
        expect(response).to redirect_to cuepoints_path
      end
    end
    context '無効なパラメータの場合' do
      before do
        @invalid_cuepoint = attributes_for(:invalid_cuepoint)
      end
      it 'リクエストは200 OKとなること' do
        post :create, cuepoint: @invalid_cuepoint
        expect(response.status).to eq 200
      end
      it 'データベースに新しいユーザーが登録されないこと' do
        expect{
          post :create, cuepoint: @invalid_cuepoint
        }.not_to change(Cuepoint, :count)
      end
      it ':newテンプレートを再表示すること' do
        post :create, cuepoint: @invalid_cuepoint
        expect(response).to render_template :new
      end
    end
  end

  describe 'Patch #update' do
    context '存在するユーザーの場合' do
      before do
        @cuepoint = create(:cuepoint)
        @originalname = @cuepoint.name
      end
      context '有効なパラメータの場合' do
        before do
          patch :update, id: @cuepoint.id, cuepoint: attributes_for(:cuepoint, name: 'hogehoge')
        end
        it 'リクエストは302 リダイレクトとなること' do
          expect(response.status).to eq 302
        end
        it 'データベースのユーザーが更新されること' do
          @cuepoint.reload
          expect(@cuepoint.name).to eq 'hogehoge'
        end
        it 'cuepoints_pathにリダイレクトすること' do
          expect(response).to redirect_to cuepoints_path
        end
      end
      context '無効なパラメータの場合' do
        before do
          patch :update, id: @cuepoint.id, cuepoint: attributes_for(:cuepoint, name: '  ')
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
        it 'データベースのユーザーは更新されないこと' do
          @cuepoint.reload
          expect(@cuepoint.name).to eq @originalname
        end
        it ':editテンプレートを再表示すること' do
          expect(response).to render_template :edit
        end
      end
    end
    context '要求されたユーザーが存在しない場合' do
      it 'リクエストはRecordNotFoundとなること' do
        expect{
          patch :update, id: 'hogehoge' , cuepoint: attributes_for(:cuepoint)
        }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'Delete #destroy' do
    before do
      @cuepoint = create(:cuepoint)
    end

    context '存在するユーザーの場合' do
      it 'リクエストは302 リダイレクトとなること' do
        delete :destroy, id: @cuepoint.id
        expect(response.status).to eq 302
      end
      it 'データベースから要求されたユーザーが削除されること' do
        expect{
          delete :destroy, id: @cuepoint.id
        }.to change(Cuepoint,:count).by(-1)
      end
      it 'cuepoints_pathにリダイレクトされること'do
        delete :destroy, id: @cuepoint.id
        expect(response).to redirect_to cuepoints_path
      end
    end
    context '要求されたユーザーが存在しない場合' do
      it 'リクエストはRecordNotFoundとなること' do
        expect{
          delete :destroy, id: 'hogehoge'
        }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

end
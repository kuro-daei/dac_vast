# キャンペーン用コントローラ
class CampaignsController < ApplicationController
  # 一覧表示
  def index
    unless params[:cuepoint_id]
      # TODO
    else
      # 下記はVAST URL呼び出しを想定
      # TODO
      response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
      response.headers['Access-Control-Allow-Methods'] = 'GET'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Credentials'] = 'true'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type'
    end
  end

  # 新規
  def new
    # TODO
  end

  # 作成
  def create
    # TODO
  end

  # 編集
  def edit
    # TODO
  end

  # 更新
  def update
    # TODO
  end

  # 削除
  def destroy
    # TODO
  end

  private
    # キャンペーン用パラメータ
    def campaign_params
      # TODO
    end
end

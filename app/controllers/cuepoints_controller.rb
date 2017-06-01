# Cue Point コントローラ
class CuepointsController < ApplicationController
  # 一覧
  def index
    @cuepoints = Cuepoint.all
  end

  # 新規
  def new
    @cuepoint = Cuepoint.new
  end

  # 作成
  def create
    @cuepoint = Cuepoint.new(cuepoint_params)
    if @cuepoint.save
      redirect_to cuepoints_path
    else
      render 'new'
    end
  end

  # 編集
  def edit
    @cuepoint = Cuepoint.find(params[:id])
  end

  # 更新
  def update
    @cuepoint = Cuepoint.find(params[:id])
    if @cuepoint.update(cuepoint_params)
      redirect_to cuepoints_path
    else
      render 'edit'
    end
  end

  # 削除
  def destroy
    @cuepoint = Cuepoint.find(params[:id])
    @cuepoint.destroy
    redirect_to cuepoints_path
  end

  private
    # キューポイント用パラメータ
    def cuepoint_params
      params[:cuepoint].permit(:name)
    end
end

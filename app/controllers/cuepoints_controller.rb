# Cue Point コントローラ
class CuepointsController < ApplicationController
  # 一覧
  def index
    @cuepoints = Cuepoint.all
  end

  # 新規作成フォーム
  def new
    @cuepoint = Cuepoint.new
  end

  # 新規作成
  def create
    @cuepoint = Cuepoint.new(cuepoint_params)
    if @cuepoint.save!
      redirect_to cuepoints_path
    else
      render 'new'
    end
  end

  # 編集フォーム
  def edit
    @cuepoint = Cuepoint.find(params[:id])
  end

  def update
    @cuepoint = Cuepoint.find(params[:id])
    if @cuepoint.update(cuepoint_params)
      redirect_to cuepoints_path
    else
      render 'edit'
    end
  end

  def destroy
    @cuepoint = Cuepoint.find(params[:id])
    @cuepoint.destroy
    redirect_to cuepoints_path
  end

  private
  def cuepoint_params
    params[:cuepoint].permit(:name)
  end
end

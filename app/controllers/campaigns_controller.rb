# キャンペーン用コントローラ
class CampaignsController < ApplicationController
  # 一覧表示
  def index
    unless params[:cuepoint_id]
      @campaigns = Campaign.all
    else
      # 下記はVAST URL呼び出しを想定
      @cuepoint = Cuepoint.find(params[:cuepoint_id])
      @campaigns = @cuepoint.campaigns.all.limit(1)
      response.headers['Access-Control-Allow-Origin'] = '*'
      response.headers['Access-Control-Allow-Methods'] = 'GET'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type'
    end
  end

  # 新規作成フォーム
  def new
    @campaign = Campaign.new
    @cuepoints = Cuepoint.all
  end

  # 新規作成
  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to campaigns_path
    else
      render 'new'
    end
  end

  # 編集用フォーム
  def edit
    @campaign = Campaign.find(params[:id])
    @cuepoints = Cuepoint.all
  end

  # 更新
  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      redirect_to campaigns_path
    else
      render 'new'
    end
  end

  # 削除
  def destroy
    @campaign = Campaign.find(params[:id])
    redirect_to campaigns_path
  end

  private
    # キャンペーン用パラメータ
    def campaign_params
      params[:campaign].permit(
        :name, :start_at, :end_at, :limit_start, :movie_url, cuepoint_ids: []
      )
    end
end

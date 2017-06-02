# キャンペーン用コントローラ
class CampaignsController < ApplicationController
  # 一覧表示
  def index
    unless params[:cuepoint_id]
      @campaigns = Campaign.all
    else
      # 下記はVAST URL呼び出しを想定
      @cuepoint = Cuepoint.find(params[:cuepoint_id])
      @campaigns = @cuepoint.campaigns.
        where("start_at <= '#{Time.now}' AND end_at >= '#{Time.now}'").to_a
      # result の count_start が campaign の limit_start よりも多い場合は表示しない。
      # reuslt の レコードが無い場合も考えられる。
      @campaigns.delete_if do |campaign|
        result = Result.where(campaign: campaign, cuepoint: @cuepoint).first
        !result.blank? && result.count_start > campaign.limit_start
      end
      response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
      response.headers['Access-Control-Allow-Methods'] = 'GET'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Credentials'] = 'true'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type'
    end
  end

  # 新規
  def new
    @campaign = Campaign.new
    @cuepoints = Cuepoint.all
  end

  # 作成
  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to campaigns_path
    else
      @cuepoints = Cuepoint.all
      render 'new'
    end
  end

  # 編集
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
    @campaign.destroy
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

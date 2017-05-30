class CampaignsController < ApplicationController

  before_action :set_campaign, only: [:edit, :update, :destroy]
  before_action :select_cuepoints, only: [:new, :edit]

  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
        redirect_to campaigns_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @campaign.update(campaign_params)
        redirect_to campaigns_path
    else
      render 'new'
    end
  end

  def destroy
    @campaign.destroy
    redirect_to campaigns_path
  end

  private

    def campaign_params
      params[:campaign].permit(:name,:start_at,:end_at,:limit_start,:movie_url,{:cuepoint_ids => []})
    end

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def select_cuepoints
      @cuepoints = Cuepoint.all 
    end

end

# レポート関連コントローラ
class ResultsController < ApplicationController
  # 結果一覧表示
  def index
    @results = Result.all.order(:cuepoint_id, :campaign_id)
  end

  # 結果追加
  def record
    @campaign = Campaign.find(params[:campaign])
    @cuepoint = Cuepoint.find(params[:cuepoint])
    @result = Result.find_or_initialize_by(campaign: @campaign, cuepoint: @cuepoint)
    logger.debug @result.inspect
    if params[:event] == 'start'
      @result.count_start += 1
    elsif params[:event] == 'complete'
      @result.count_complete += 1
    end
    @result.save!
  end
end

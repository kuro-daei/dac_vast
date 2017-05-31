# レポート関連コントローラ
class ResultsController < ApplicationController
  # 結果一覧表示
  def index
    @results = Result.all
  end

  # 結果追加
  def add
    @result = Result.new
    @result.campaign = Campaign.find(params[:campaign])
    @result.cuepoint = Cuepoint.find(params[:cuepoint])
    @result.event = params[:event]
    @result.save!
  end
end

# キャンペーン用コントローラ
class CampaignsController < ApplicationController
  # 一覧表示
  def index
    unless params[:cuepoint_id]
      @campaigns = Campaign.all
    else
      # 下記はVAST URL呼び出しを想定
      # パラメータのcuepoint_idに紐づくキャンペーンを取得
      @campaigns = Campaign.includes(:cuepoints).where('cuepoints.id' => params[:cuepoint_id])
      @campCandidate = []
      now = Time.now
      @campaigns.each do |campaign|
        # 日時チェック
        # 条件：開始日時が現在より後、または終了日時が現在より前であればnext
        if campaign.start_at > now || campaign.end_at < now
          next
        end
        # ゴールチェック
        # 条件：limit_startが実績より少なければレスポンス候補に追加
        #      もしくはresultsがまだ無い場合もレスポンス候補に追加
        @result = Result.find_by(campaign_id: campaign.id)
        if @result == nil
          @campCandidate.push(campaign)
        elsif campaign.limit_start < @result.count_start
            @campCandidate.push(campaign)
        end
      end

      if @campCandidate.length > 0
        # ランダムで１つ選択
        @resCampaign = @campCandidate.sample
        logger.debug "==========================="
        logger.debug "#{@resCampaign.name}が選択されました"
        logger.debug "==========================="

        # XMLを生成
        render :xml => <<-EOS
          <VAST version="2.0">
          <Ad id="#{@resCampaign.id}">
          <InLine>
          <AdSystem version="1">VAST AdServer</AdSystem>
          <AdTitle>
          <![CDATA[ #{@resCampaign.id} ]]>
          </AdTitle>
          <Creatives>
          <Creative id="#{@resCampaign.id}">
          <Linear>
          <MediaFiles>
          <MediaFile delivery="progressive" bitrate="2418" width="500" height="500" type="video/mp4">
          <![CDATA[
              #{@resCampaign.movie_url}
          ]]>
          </MediaFile>
          </MediaFiles>
          <TrackingEvents>
          <Tracking event="start">
          <![CDATA[
          http://localhost:3000/results/record?event=start&campaign=#{@resCampaign.id}&cuepoint=#{params[:cuepoint_id]}
          ]]>
          </Tracking>
          <Tracking event="complete">
          <![CDATA[
          http://localhost:3000/results/record?event=complete&campaign=#{@resCampaign.id}&cuepoint=#{params[:cuepoint_id]}
          ]]>
          </Tracking>
          </TrackingEvents>
          </Linear>
          </Creative>
          </Creatives>
          </InLine>
          </Ad>
          </VAST>
        EOS

        response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
        response.headers['Access-Control-Allow-Methods'] = 'GET'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Credentials'] = 'true'
        headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type'
      else
        # 広告選択されなかった場合のXML
        render :xml => <<-EOS
          <VAST></VAST>
        EOS
        response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
        response.headers['Access-Control-Allow-Methods'] = 'GET'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Allow-Credentials'] = 'true'
        headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type'
      end
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

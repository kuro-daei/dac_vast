module ApplicationHelper
  def track_url(campaign, cuepoint, event)
    url = request.protocol + request.host_with_port + '/results/add?'
    url += { campaign: campaign, cuepoint: @cuepoint, event: 'start' }.to_query
    url
  end

  def vast_url(cuepoint)
    request.protocol + request.host_with_port + cuepoint_campaigns_path(@cuepoint) + '.xml'
  end
end

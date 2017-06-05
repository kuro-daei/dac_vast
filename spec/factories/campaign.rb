
FactoryGirl.define do

  factory :campaign do
    name 'ノーマルキャンペーン'
    limit_start 500
    movie_url 'http://video.here.com/'
    start_at '2017/05/01'
    end_at '2017/05/31'
  end

end

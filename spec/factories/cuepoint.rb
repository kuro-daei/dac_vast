
FactoryGirl.define do

  factory :cuepoint do
    name 'テストキューポイント'
  end

  factory :invalid_cuepoint, class: Cuepoint do
    name 'a'
  end

end

require 'rails_helper'
describe Campaign do

  it '保存可能な状態' do
    campaign = build(:campaign)
    expect(campaign.save).to eq(true)
  end

  it '名前の長さ境界値チェック' do
    campaign = build(:campaign)
    campaign.name = nil
    expect(campaign.save).to eq(false)
    campaign.name = 'a' * 4
    expect(campaign.save).to eq(false)
    campaign.name = 'a' * 5
    expect(campaign.save).to eq(true)
    campaign.name = 'a' * 20
    expect(campaign.save).to eq(true)
    campaign.name = 'a' * 21
    expect(campaign.save).to eq(false)
  end

  it '同じ名前は登録できない' do
    campaign = build(:campaign)
    campaign.name = 'abcdef'
    expect(campaign.save).to eq(true)
    campaign = build(:campaign)
    campaign.name = 'abcdef'
    expect(campaign.save).to eq(false)
  end

  it 'movie_urlの境界値チェック' do
    campaign = build(:campaign)
    campaign.movie_url = nil
    expect(campaign.save).to eq(false)
    campaign.movie_url = 'a' * 4
    expect(campaign.save).to eq(false)
    campaign.movie_url = 'a' * 5
    expect(campaign.save).to eq(true)
    campaign.movie_url = 'a' * 100
    expect(campaign.save).to eq(true)
    campaign.movie_url = 'a' * 101
    expect(campaign.save).to eq(false)
  end

end

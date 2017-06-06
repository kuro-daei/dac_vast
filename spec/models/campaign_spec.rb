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

  it 'limit_startが整数でない' do
    campaign = build(:campaign)
    campaign.limit_start = nil
    expect(campaign.save).to eq(false)
    campaign.limit_start = 'a'
    expect(campaign.save).to eq(false)
    campaign.limit_start = -1
    expect(campaign.save).to eq(false)
    campaign.limit_start = 100.5
    expect(campaign.save).to eq(false)
  end

  it 'limit_startの境界値チェック' do
    campaign = build(:campaign)
    campaign.limit_start = 0
    expect(campaign.save).to eq(false)
    campaign.limit_start = 1
    expect(campaign.save).to eq(true)
    campaign.limit_start = 9999
    expect(campaign.save).to eq(true)
    campaign.limit_start = 10000
    expect(campaign.save).to eq(false)
  end

  it 'start_atが正しい日付でない' do
    campaign = build(:campaign)
    campaign.start_at = 1
    expect(campaign.save).to eq(false)
    campaign.start_at = 'abc'
    expect(campaign.save).to eq(false)
    campaign.start_at = '2017/5/0'
    expect(campaign.save).to eq(false)
    campaign.start_at = '2017/5/1 12:12:99'
    expect(campaign.save).to eq(false)
  end

  it 'end_atが正しい日付でない' do
    campaign = build(:campaign)
    campaign.end_at = 1
    expect(campaign.save).to eq(false)
    campaign.end_at = 'abc'
    expect(campaign.save).to eq(false)
    campaign.end_at = '2017/5/0'
    expect(campaign.save).to eq(false)
    campaign.end_at = '2017/5/1 12:12:99'
    expect(campaign.save).to eq(false)
  end

  it 'start_atがend_atよりも大きい(開始が終了よりも後)' do
    campaign = build(:campaign)
    campaign.start_at = '2017/05/01 00:00:01'
    campaign.end_at = '2017/05/01 00:00:00'
    expect(campaign.save).to eq(false)
    # 同一時刻は正常
    campaign.start_at = '2017/05/01 00:00:00'
    campaign.end_at = '2017/05/01 00:00:00'
    expect(campaign.save).to eq(true)
  end

  it 'start_at、end_atが過去日、未来日' do
    campaign = build(:campaign)
    campaign.start_at = '2000/05/01 00:00:00'
    expect(campaign.save).to eq(true)
    campaign.end_at = '2001/05/01 00:00:00'
    expect(campaign.save).to eq(true)
    campaign.end_at = '2020/05/01 00:00:00'
    expect(campaign.save).to eq(true)
    campaign.start_at = '2019/05/01 00:00:00'
    expect(campaign.save).to eq(true)
  end

end
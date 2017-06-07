require 'rails_helper'
describe Cuepoint do

  it '保存可能な状態' do
    cuepoint = build(:cuepoint)
    expect(cuepoint.save).to eq(true)
  end

  it '名前の長さ境界値チェック' do
    cuepoint = build(:cuepoint)
    cuepoint.name = nil
    expect(cuepoint.save).to eq(false)
    cuepoint.name = 'a' * 4
    expect(cuepoint.save).to eq(false)
    cuepoint.name = 'a' * 5
    expect(cuepoint.save).to eq(true)
    cuepoint.name = 'a' * 20
    expect(cuepoint.save).to eq(true)
    cuepoint.name = 'a' * 21
    expect(cuepoint.save).to eq(false)
  end

  it '同じ名前は登録できない' do
    cuepoint = build(:cuepoint)
    cuepoint.name = 'abcdef'
    expect(cuepoint.save).to eq(true)
    cuepoint = build(:cuepoint)
    cuepoint.name = 'abcdef'
    expect(cuepoint.save).to eq(false)
  end
end

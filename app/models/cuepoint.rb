class Cuepoint < ApplicationRecord
  has_and_belongs_to_many :campaigns
  has_many :results, dependent: :destroy
end

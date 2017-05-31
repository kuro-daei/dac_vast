class Campaign < ApplicationRecord
  has_and_belongs_to_many :cuepoints
  has_many :results, dependent: :destroy
end

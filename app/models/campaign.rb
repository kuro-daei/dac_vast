class Campaign < ApplicationRecord
  has_and_belongs_to_many :cuepoints
  has_many :results, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :limit_start, numericality: { greater_than: 0, less_than: 10000 }
  validates :movie_url, presence: true, length: { in: 5..100 }
  validates_datetime :start_at
  validates_datetime :end_at, on_or_after: :start_at
end

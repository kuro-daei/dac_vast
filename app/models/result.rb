class Result < ApplicationRecord
  after_initialize :zero_clear

  belongs_to :campaign
  belongs_to :cuepoint

  def zero_clear
    self.count_start ||= 0
    self.count_complete ||= 0
  end
end

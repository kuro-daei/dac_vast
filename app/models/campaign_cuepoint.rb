class CampaignCuepoint < ApplicationRecord
  belongs_to :cuepoint
  belongs_to :campaign
end

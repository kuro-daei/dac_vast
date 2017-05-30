class RenameCampaignsQuepointsToCampaignsCuepoints < ActiveRecord::Migration[5.0]
  def change
    rename_table :campaigns_quepoints, :campaigns_cuepoints
  end
end

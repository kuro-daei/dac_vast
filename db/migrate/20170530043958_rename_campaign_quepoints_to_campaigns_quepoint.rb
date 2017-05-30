class RenameCampaignQuepointsToCampaignsQuepoint < ActiveRecord::Migration[5.0]
  def change
    rename_table :campaign_quepoints, :campaigns_quepoints
  end
end

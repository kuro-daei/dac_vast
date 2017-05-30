class AddDeletedAtToCampaignQuepoints < ActiveRecord::Migration[5.0]
  def change
    add_column :campaign_quepoints, :deleted_at, :datetime
  end
end

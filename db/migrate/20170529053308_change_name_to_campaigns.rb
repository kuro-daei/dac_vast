class ChangeNameToCampaigns < ActiveRecord::Migration[5.0]
  def change
    change_column :Campaigns, :name, :string, null: false
    change_column :Campaigns, :start_at, :datetime, null: false
    change_column :Campaigns, :end_at, :datetime, null: false
    change_column :Campaigns, :limit_start, :integer, null: false
    change_column :Campaigns, :movie_url, :string, null: false
  end
end

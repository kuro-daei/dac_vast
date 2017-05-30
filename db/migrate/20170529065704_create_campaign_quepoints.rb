class CreateCampaignQuepoints < ActiveRecord::Migration[5.0]
  def change
    create_table :campaign_quepoints, :id => false do |t|
      t.references :quepoint, foreign_key: true, null: false
      t.references :campaign, foreign_key: true, null: false

      t.timestamps
    end
  end
end

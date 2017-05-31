class Setup < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.integer :limit_start
      t.string :movie_url
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :campaigns, :deleted_at

    create_table :cuepoints do |t|
      t.string :name
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :cuepoints, :deleted_at

    create_table :campaigns_cuepoints, id: false do |t|
      t.references :cuepoint, foreign_key: false, null: false
      t.references :campaign, foreign_key: false, null: false
    end
  end
end

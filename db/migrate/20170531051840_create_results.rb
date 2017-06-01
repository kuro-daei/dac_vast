class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.references :campaign, foreign_key: false
      t.references :cuepoint, foreign_key: false
      t.integer :count_start
      t.integer :count_complete
      t.string :deleted_at
      t.timestamps
    end
  end
end

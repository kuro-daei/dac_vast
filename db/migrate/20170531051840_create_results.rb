class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string :event
      t.references :campaign, foreign_key: false
      t.references :cuepoint, foreign_key: false
      t.string :deleted_at

      t.timestamps
    end
  end
end

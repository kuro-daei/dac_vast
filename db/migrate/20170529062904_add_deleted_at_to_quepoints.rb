class AddDeletedAtToQuepoints < ActiveRecord::Migration[5.0]
  def change
    add_column :quepoints, :deleted_at, :datetime
  end
end

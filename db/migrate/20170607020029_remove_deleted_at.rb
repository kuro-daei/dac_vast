class RemoveDeletedAt < ActiveRecord::Migration[5.0]
  def change
    remove_column :campaigns, :deleted_at
    remove_column :cuepoints, :deleted_at
    remove_column :results, :deleted_at
  end
end

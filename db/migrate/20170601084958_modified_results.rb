class ModifiedResults < ActiveRecord::Migration[5.0]
  def change
    add_column :results, :count_start, :integer
    add_column :results, :count_complete, :integer
    remove_column :results, :event, :string
  end
end

class RenameQuepointsToCuepoints < ActiveRecord::Migration[5.0]
  def change
    rename_table :quepoints, :cuepoints
  end
end

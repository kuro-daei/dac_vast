class RenameQuepointIdColumnToCuepointId < ActiveRecord::Migration[5.0]
  def change
    rename_column :Campaigns_Cuepoints, :quepoint_id, :cuepoint_id
  end
end

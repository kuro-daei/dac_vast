class Rename < ActiveRecord::Migration[5.0]
  def change
    rename_table :Campaigns_Cuepoints, :campaigns_cuepointsaaa
  end
end

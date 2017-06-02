class Rerename < ActiveRecord::Migration[5.0]
  def change
    rename_table :campaigns_cuepointsaaa, :campaigns_cuepoints
  end
end

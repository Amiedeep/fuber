class ChangeTypeForLatLng < ActiveRecord::Migration[5.0]
  def change
    change_column :locations, :lattitude, :float
    change_column :locations, :longitude, :float
  end
end

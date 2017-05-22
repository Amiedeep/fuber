class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.decimal :lattitude
      t.decimal :longitude

      t.timestamps
    end
  end
end

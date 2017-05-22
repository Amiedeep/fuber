class CreateTaxis < ActiveRecord::Migration[5.0]
  def change
    create_table :taxis do |t|
      t.string :type
      t.integer :location_id

      t.timestamps
    end
  end
end

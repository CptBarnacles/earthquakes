class CreateEarthquakes < ActiveRecord::Migration[5.2]
  def change
    create_table :earthquakes do |t|
      t.integer :quakeID
      t.string :locationSource
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end

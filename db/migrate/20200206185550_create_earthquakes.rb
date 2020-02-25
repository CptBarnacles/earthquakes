class CreateEarthquakes < ActiveRecord::Migration[5.2]
  def change
    create_table :earthquakes, id: false do |t|
      t.string :locationSource
      t.decimal :latitude, :precision => 8, :scale => 10, :default => 0.0
      t.decimal :longitude, :precision => 8, :scale => 10, :default => 0.0

      t.timestamps
    end
  end
end

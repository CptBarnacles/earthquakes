class AddTimeToEarthquakes < ActiveRecord::Migration[5.2]
  def change
    add_column :earthquakes, :time, :string
  end
end

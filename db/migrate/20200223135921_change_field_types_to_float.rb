class ChangeFieldTypesToFloat < ActiveRecord::Migration[5.2]
  def change
  	change_column :earthquakes, :latitude, :float, :precision => 10, :scale => 4
  	change_column :earthquakes, :longitude, :float, :precision => 10, :scale => 4
  end
end

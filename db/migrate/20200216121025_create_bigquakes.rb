class CreateBigquakes < ActiveRecord::Migration[5.2]
  def change
    create_table :bigquakes do |t|
      t.string :locationSource
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :magError

      t.timestamps
    end
  end
end

require 'csv'
namespace :putquakes do
  desc "pull earthquake location from csv"
  task seed_quakes: :environment do

    #drop the old table data before importing the new stuff
    Earthquake.destroy_all
	
    CSV.foreach("lib/assets/all_week.csv", :headers =>true) do |row |
      puts row.inspect #just so that we know the file's being read

      #create new model instances with the data
      Earthquake.create!(
      locationSource: row[13].tr('"', ''),
      latitude: row[1].to_d,
      longitude: row[2].to_d,
      time: row[0].to_s,
      quakeID: row[4].to_s
      )
    end
  end

end


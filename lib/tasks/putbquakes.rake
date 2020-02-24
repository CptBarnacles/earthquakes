require 'csv'
namespace :putbquakes do
  desc "pull earthquake location from csv"
  task seed_bquakes: :environment do

    #drop the old table data before importing the new stuff
    Bigquake.destroy_all
	CSV.foreach("lib/assets/4.5_month.csv", :headers =>true) do |row |
      puts row.inspect #just so that we know the file's being read

      #create new model instances with the data
      Bigquake.create!(
  	  locationSource: row[13].tr('"', ''),
  	  latitude: row[1].to_i,
  	  longitude: row[2].to_i,
  	  magError: row[4].to_i
  	  )
    end
    
  end

end


require 'csv'
namespace :putquakes do
  desc "pull earthquake location from csv"
  task seed_quakes: :environment do

    
    Earthquake.destroy_all
    Bigquake.destroy_all
	
    CSV.foreach("lib/assets/all_week.csv", :headers =>true) do |row |
      puts row.inspect 

      #create new model from the csv 
      Earthquake.create!(
      locationSource: row[13].tr('"', ''), #attempted to trim unwanted quotation marks that might confuse parsing
      latitude: row[1].to_d,
      longitude: row[2].to_d,
      time: row[0].to_s,
      quakeID: row[4].to_s
      )
    end

    CSV.foreach("lib/assets/4.5_month.csv", :headers =>true) do |row |
      puts row.inspect

      
      Bigquake.create!(
      locationSource: row[13].tr('"', ''),
      latitude: row[1].to_i,
      longitude: row[2].to_i,
      magError: row[4].to_i
      )
     end
  end
end


json.extract! earthquake, :id, :locationSource, :latitude, :longitude, :created_at, :updated_at
json.url earthquake_url(earthquake, format: :json)

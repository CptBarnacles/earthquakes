json.extract! bigquake, :id, :locationSource, :latitude, :longitude, :magError, :created_at, :updated_at
json.url bigquake_url(bigquake, format: :json)

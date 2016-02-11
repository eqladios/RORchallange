json.array!(@trips) do |trip|
  json.extract! trip, :id, :time, :date, :source, :destination
  json.url trip_url(trip, format: :json)
end

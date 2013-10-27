json.array!(@locations) do |location|
  json.extract! location, :name, :ip_address, :active
  json.url location_url(location, format: :json)
end

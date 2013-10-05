json.array!(@spins) do |spin|
  json.extract! spin, :off_time, :result_time, :result, :location_id, :user_id, :session_id
  json.url spin_url(spin, format: :json)
end

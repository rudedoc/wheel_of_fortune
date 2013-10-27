json.array!(@prizes) do |prize|
  json.extract! prize, :title, :description
  json.url prize_url(prize, format: :json)
end

json.array!(@churches) do |church|
  json.extract! church, :id
  json.url church_url(church, format: :json)
end

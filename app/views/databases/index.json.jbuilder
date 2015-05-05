json.array!(@databases) do |database|
  json.extract! database, :id, :name, :comment, :adapter, :encoding, :host, :pool, :username, :password, :database, :image_path
  json.url database_url(database, format: :json)
end

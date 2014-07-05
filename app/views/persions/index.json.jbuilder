json.array!(@persions) do |persion|
  json.extract! persion, :id, :name, :bio, :birthday
  json.url persion_url(persion, format: :json)
end

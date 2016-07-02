json.array!(@locations) do |location|
  json.extract! location, :id, :name, :address_street, :address_city, :address_state_or_province, :address_postal_code, :country, :student_capacity
  json.url location_url(location, format: :json)
end

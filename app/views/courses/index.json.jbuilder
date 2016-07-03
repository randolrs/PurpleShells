json.array!(@courses) do |course|
  json.extract! course, :id, :user_id, :title, :description, :location_id, :city_id
  json.url course_url(course, format: :json)
end

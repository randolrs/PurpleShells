json.array!(@course_sessions) do |course_session|
  json.extract! course_session, :id, :title, :description, :user_id, :course_id
  json.url course_session_url(course_session, format: :json)
end

json.array!(@class_topics) do |class_topic|
  json.extract! class_topic, :id, :parent_topic_id, :name, :url
  json.url class_topic_url(class_topic, format: :json)
end

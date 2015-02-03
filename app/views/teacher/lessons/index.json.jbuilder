json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :name, :start_date, :end_date, :event_id
  json.url lesson_url(lesson, format: :json)
end

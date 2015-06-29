json.array! @event.days do |day|
  json.day_id day.id
  json.event_on day.event_on
end

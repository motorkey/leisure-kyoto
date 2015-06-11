@event.days.each do |day|
  reservations_on_day = day.reservations.where(event_day_id: day.id)
  json.array! reservations_on_day do |reservation|
    json.id reservation.id
    json.title reservation.number.to_s + '名 :' + reservation.name
    json.start day.event_on
  end
end

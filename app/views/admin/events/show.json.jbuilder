json.array!(@event.days) do |day|
  reservations_on_day = day.reservations.where(event_day_id: day.id)
  reservations_on_day.each do |reservation|
    json.title reservation.name
    json.start day.event_on
  end
end

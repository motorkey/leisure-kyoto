$ ->
  $calendar = $('#calendar_show_reservations')
  event_id = $calendar.data('event-id')
  $calendar.fullCalendar
    aspectRatio: 1.0
    eventLimit: true
    eventSources:
      url: event_id + '.json'
      allDayDefault: true
      cache: true

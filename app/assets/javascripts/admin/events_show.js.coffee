$(document).on 'ready page:load', ->
  $calendar = $('#calendar_show_reservations')
  event_id = $calendar.data('event-id')
  $calendar.fullCalendar {
    aspectRatio: 1.0
    eventLimit: true
    eventSources: [
      # your event source
      {
        url: event_id + '.json'
        allDayDefault: true
        cache: true
      }
      # any other sources...
    ]
  }

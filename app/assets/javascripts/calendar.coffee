$(document).on 'ready page:load', ->
  $calendar = $('#calendar')
  event_id = $calendar.data('event-id')
  $('#calendar').fullCalendar {
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
  return

$(document).on 'ready page:load', ->
  $calendar = $('#calendar')
  id = $calendar.attr('name')
  $('#calendar').fullCalendar {
    eventSources: [
      # your event source
      {
        url: id + '.json'
        allDayDefault: true
        cache: true
      }
      # any other sources...
    ]
  }
  return

$(document).on 'ready page:load', ->
  $('#calendar').fullCalendar {
    eventSources: [
      # your event source
      {
        url: 'sample_json_data.json'
        allDayDefault: true
      }
      # any other sources...
    ]
  }
  return

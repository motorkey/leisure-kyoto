$(document).on 'ready page:load', ->
  $('#calendar').fullCalendar {
    eventSources: [
      # your event source
      {


        # 1をidにせよ
        url: '1.json'
        allDayDefault: true
      }
      # any other sources...
    ]
  }
  return

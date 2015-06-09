# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# gmaps4rails
###
window.onload = ->
  handler = Gmaps.build 'Google'
  handler.buildMap {
    provider:
      disableDefaultUI: true
      center:
        lat: 35
        lng: 135
    internal:
      id: 'map'
  }, ->
    markers = handler.addMarkers([{
      'lat': 35
      'lng': 135
      'picture':
        #'url': 'https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png'
        'url': '../app/assets/images/map-pin-blue.jpg'
        'width': 36
        'height': 36
    }])
    handler.getMap().setZoom 12
    return
###


# fullcalendar
$(document).ready ->
  $('#calendar').fullCalendar {}
  return


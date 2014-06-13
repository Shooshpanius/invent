# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@room_new_show = () ->
  $.ajax
    url: '/room/srv_room_new_show'
    type: 'POST'
    async: false
    data: {}
    success: (msg) ->
      $("#room_new_dialog").html msg
    false
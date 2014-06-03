# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@territory_new_show = () ->
  $.ajax
    url: '/territory/srv_territory_new_show'
    type: 'POST'
    async: false
    data: {}
    success: (msg) ->
      $("#territory_new_dialog").html msg
    false
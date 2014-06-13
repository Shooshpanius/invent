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

@room_new_save = () ->

  $("#room_new").validate
    rules:
      room_name:
        required: true
      territories:
        required: true

    errorClass: "input_error"
    errorElement: "em"
    messages:
      room_name: ""
      territories: ""

    submitHandler: (form) ->
      queryString = $("#room_new").serialize()
      $.ajax
        url: "/room/srv_room_new_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#mRoomNew").modal 'hide'
          location.reload()
      false

$(document).ready ->
  $("#tbl_rooms").tablesorter(
    headers:
      0:
        filter: false
      3:
        filter: false
        sorter: false
    widthFixed : true
    widgets: [
      "zebra"
      "filter"
    ]
    widgetOptions :
      filter_hideFilters: true
      filter_childRows: false
      filter_startsWith: false

  ).tablesorterPager container: $("#pager"), size: 20
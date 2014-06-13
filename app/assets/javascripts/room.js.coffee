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

@room_edit_show = (room_id) ->
  $.ajax
    url: '/room/srv_room_edit_show'
    type: 'POST'
    async: false
    data: {room_id: room_id}
    success: (msg) ->
      $("#room_edit_dialog").html msg
    false

@room_delete = (room_id) ->
  if confirm('Удалить кабинет?')
    $.ajax
      url: '/room/srv_room_delete'
      type: 'POST'
      async: false
      data: {room_id: room_id}
      success: (msg) ->
        alert(msg)
        location.reload()
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

@room_edit_save = () ->
  $("#room_edit").validate
    rules:
      room_id:
        required: true
      room_name:
        required: true
      room_territory:
        required: true
    errorClass: "input_error"
    errorElement: "em"
    messages:
      room_id: ""
      room_name: ""
      room_territory: ""
    submitHandler: (form) ->
      queryString = $("#room_edit").serialize()
      $.ajax
        url: "/room/srv_room_edit_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#mRoomEdit").modal 'hide'
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
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@workplace_new_show = () ->
  $.ajax
    url: '/workplace/srv_workplace_new_show'
    type: 'POST'
    async: false
    data: {}
    success: (msg) ->
      $("#workplace_new_dialog").html msg
    false

@workplace_edit_show = (workplace_id) ->
  $.ajax
    url: '/workplace/srv_workplace_edit_show'
    type: 'POST'
    async: false
    data: {workplace_id: workplace_id}
    success: (msg) ->
      $("#workplace_edit_dialog").html msg
    false

@workplace_delete = (workplace_id) ->
  if confirm('Удалить рабочее место?')
    $.ajax
      url: '/workplace/srv_workplace_delete'
      type: 'POST'
      async: false
      data: {workplace_id: workplace_id}
      success: (msg) ->
        alert(msg)
        location.reload()
      false


@workplace_new_save = () ->

  $("#workplace_new").validate
    rules:
      workplace_name:
        required: true
      rooms:
        required: true

    errorClass: "input_error"
    errorElement: "em"
    messages:
      workplace_name: ""
      rooms: ""

    submitHandler: (form) ->
      queryString = $("#workplace_new").serialize()
      $.ajax
        url: "/workplace/srv_workplace_new_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#mWorkplaceNew").modal 'hide'
          location.reload()
      false

$(document).ready ->
  $("#tbl_workplaces").tablesorter(
    headers:
      0:
        filter: false
      4:
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

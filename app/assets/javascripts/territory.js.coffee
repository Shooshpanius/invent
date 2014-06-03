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

@territory_new_save = () ->

  $("#territory_new").validate
    rules:
      territory_name:
        required: true
      territory_address:
        required: true

    errorClass: "input_error"
    errorElement: "em"
    messages:
      territory_name: ""
      territory_address: ""

    submitHandler: (form) ->
      queryString = $("#territory_new").serialize()
      $.ajax
        url: "/territory/srv_territory_new_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#mTerritoryNew").modal 'hide'
          location.reload()
      false


$(document).ready ->
  $("#tbl_territories").tablesorter(
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


    widgetOptions:
      filter_hideFilters: true
      filter_childRows: false
      filter_startsWith: false

  ).tablesorterPager container: $("#pager"), size: 20
  return


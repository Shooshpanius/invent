# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@cartridge_new_show = () ->
  $.ajax
    url: '/cartridge/srv_cartridge_new_show'
    type: 'POST'
    async: false
    data: {}
    success: (msg) ->
      $("#cartridge_new_dialog").html msg
    false


$(document).ready ->
  $("#tbl_cartridges").tablesorter(
    headers:
      0:
        filter: false
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
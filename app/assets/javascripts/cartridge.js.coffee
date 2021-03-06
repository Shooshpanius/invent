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

@cartridge_edit_show = (cartridge_id) ->
  $.ajax
    url: '/cartridge/srv_cartridge_edit_show'
    type: 'POST'
    async: false
    data: {cartridge_id: cartridge_id}
    success: (msg) ->
      $("#cartridge_edit_dialog").html msg
    false

@cartridge_delete = (cartridge_id) ->
  if confirm('Удалить картридж?')
    $.ajax
      url: '/cartridge/srv_cartridge_delete'
      type: 'POST'
      async: false
      data: {cartridge_id: cartridge_id}
      success: (msg) ->
        alert(msg)
        location.reload()
      false

@cartridge_new_save = () ->
  $("#cartridge_new").validate
    rules:
      cartridge_inv_number:
        required: true
      cartridge_model:
        required: true
      cartridge_room:
        required: true
      cartridge_printer:
        required: true
    errorClass: "input_error"
    errorElement: "em"
    messages:
      cartridge_inv_number: ""
      cartridge_model: ""
      cartridge_room: ""
      cartridge_printer: ""
    submitHandler: (form) ->
      queryString = $("#cartridge_new").serialize()
      $.ajax
        url: "/cartridge/srv_cartridge_new_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#mCartridgeNew").modal 'hide'
          location.reload()
      false

@cartridge_edit_save = () ->
  $("#cartridge_edit").validate
    rules:
      cartridge_id:
        required: true
      cartridge_inv_number:
        required: true
      cartridge_model:
        required: true
      cartridge_room:
        required: true
      cartridge_printer:
        required: true
    errorClass: "input_error"
    errorElement: "em"
    messages:
      cartridge_inv_number: ""
      cartridge_model: ""
      cartridge_room: ""
      cartridge_printer: ""
    submitHandler: (form) ->
      queryString = $("#cartridge_edit").serialize()
      $.ajax
        url: "/cartridge/srv_cartridge_edit_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#mCartridgeEdit").modal 'hide'
          location.reload()
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
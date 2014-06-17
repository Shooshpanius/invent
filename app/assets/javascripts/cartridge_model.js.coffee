# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@cartridge_model_new_show = () ->
  $.ajax
    url: '/cartridge_model/srv_cartridge_model_new_show'
    type: 'POST'
    async: false
    data: {}
    success: (msg) ->
      $("#cartridge_model_new_dialog").html msg
    false

@cartridge_model_edit_show = (cartridge_model_id) ->
  $.ajax
    url: '/cartridge_model/srv_cartridge_model_edit_show'
    type: 'POST'
    async: false
    data: {cartridge_model_id: cartridge_model_id}
    success: (msg) ->
      $("#cartridge_model_edit_dialog").html msg
    false

@cartridge_model_delete = (cartridge_model_id) ->
  if confirm('Удалить модель?')
    $.ajax
      url: '/cartridge_model/srv_cartridge_model_delete'
      type: 'POST'
      async: false
      data: {cartridge_model_id: cartridge_model_id}
      success: (msg) ->
        alert(msg)
        location.reload()
      false

@cartridge_model_new_save = () ->
  $("#cartridge_model_new").validate
    rules:
      cartridge_model_model:
        required: true
    errorClass: "input_error"
    errorElement: "em"
    messages:
      cartridge_model_model: ""
    submitHandler: (form) ->
      queryString = $("#cartridge_model_new").serialize()
      $.ajax
        url: "/cartridge_model/srv_cartridge_model_new_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#mCartridgeModelNew").modal 'hide'
          location.reload()
      false

@cartridge_model_edit_save = () ->
  $("#cartridge_model_edit").validate
    rules:
      cartridge_model_id:
        required: true
      cartridge_model_model:
        required: true
    errorClass: "input_error"
    errorElement: "em"
    messages:
      cartridge_model_id: ""
      cartridge_model_model: ""
    submitHandler: (form) ->
      queryString = $("#cartridge_model_edit").serialize()
      $.ajax
        url: "/cartridge_model/srv_cartridge_model_edit_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#mCartridgeModelEdit").modal 'hide'
          location.reload()
      false

$(document).ready ->
  $("#tbl_cartridge_models").tablesorter(
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
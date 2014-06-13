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
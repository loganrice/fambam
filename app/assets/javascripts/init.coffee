window.App ||= {}

App.init = ->
  $(".alert").delay(2000).slideUp(200, () ->
    $(this).alert('close')
  )

$(document).on "page:change", ->
  App.init()

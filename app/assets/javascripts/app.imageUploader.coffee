class App.imageUploader
  constructor: (@dropArea, @formArea) ->
    Dropzone.autoDiscover = false;
    $(@dropArea).dropzone({
      url: "/images",
      maxFilesize: 1,
      paramName: "image[file]",
      addRemoveLinks: true
    })

  render: ->
    $(@imageInput).change ->
      $(@formArea).submit()

$(document).on "page:change", ->
  return unless $(".images.new").length > 0
  imageUploader = new App.imageUploader("#dropArea", "#imageInput")
  imageUploader.render()




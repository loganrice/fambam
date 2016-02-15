class App.imageUploader
  constructor: (@templateHtml) ->
    @dropArea = new Dropzone(document.body, {
      url: "/images",
      maxFilesize: 5,
      thumbnailWidth: 80,
      thumbnailHeight: 80,
      paramName: "image[file]",
      addRemoveLinks: true,
      previewTemplate: @templateHtml,
      previewsContainer: "#previews",
      clickable: 'body',
      addRemoveLinks: false
    })
      
  render: ->

$(document).on "page:change", ->
  return unless $(".images.new").length > 0
  templateHtml = $(".imageUploadTemplate").parent().html()
  $(".imageUploadTemplate").remove()
  imageUploader = new App.imageUploader(templateHtml)
  imageUploader.render()




class ImagesController < ApplicationController
  before_action :authenticate_person!

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.file = params["file"]
    if @image.save
      render :json => @image.as_json
    end
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end

end

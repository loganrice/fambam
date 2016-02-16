class ImagesController < ApplicationController
  before_action :authenticate_person!

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(person: current_person)
    @image.file = params["image"]["file"]
    if @image.save
      render :json => @image.as_json
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:file, :person)
  end

end

class PlacesController < ApplicationController
  before_action :authenticate_person!

  def index
    if params[:tag]
      @images = Image.tagged_with(params[:tag])
    else
      @images = Image.all
    end
  end
end

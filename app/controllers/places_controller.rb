class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params.fetch("id"))
    @entries = @place.entries
  end

  def new
  end

  def create
    @place = Place.new
    @place.name = params.fetch("name")

    if @place.save
      redirect_to("/places")
    else
      redirect_to("/places/new")
    end
  end

end

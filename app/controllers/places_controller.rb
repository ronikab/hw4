class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    if @current_user != nil
      @place = Place.find_by({ "id" => params["id"] })
      @posts = Post.where({ "place_id" => @place["id"], "user_id" => @current_user["id"] })
    else
      @place = Place.find_by({ "id" => params["id"] })
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place.save
    redirect_to "/places"
  end

end

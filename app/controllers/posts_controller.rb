class PostsController < ApplicationController

  def index
    @posts = Post.where({  "place_id" => @place["id"] , "user_id" => @current_user["id"] })
  end

  def new
    if @current_user != nil
      @post = Post.new
      @post.place_id = params["place_id"]
    else 
      flash["notice"] = "Login to post!"
      redirect_to "/login"
    end
  end

  def create
    if @current_user != nil
      @post = Post.new
      @post["title"] = params["post"]["title"]
      @post["description"] = params["post"]["description"]
      @post["posted_on"] = params["post"]["posted_on"]
      @post["place_id"] = params["post"]["place_id"]
      @post.uploaded_image.attach(params["post"]["uploaded_image"])
      @post["user_id"] = @current_user["id"]
      # @post["image"] = params["post"]["image"]
      @post.save
      redirect_to "/places/#{@post["place_id"]}"
    end
  end

end

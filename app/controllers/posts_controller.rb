class PostsController < ApplicationController

  def index
    @posts = Post.where({ "user_id" => session["user_id"] })
    @posts = Post.all
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
      # @post["image"] = params["post"]["image"]
      @post.save
      redirect_to "/places/#{@post["place_id"]}"
    end
  end

end

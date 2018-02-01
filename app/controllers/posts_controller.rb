class PostsController < ApplicationController
  # before_action :authenticate_user!, except: [:show]
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all

    @comment = @post.comments.new

    if !current_user
      ip_address = IpService.new
      @post.views.create(city: ip_address.detect_city(request.remote_ip), ip_address: request.remote_ip)
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :content)
  end
end

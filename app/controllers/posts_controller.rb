class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
    if @post.published === false && !current_user
      flash[:alert] = "Content unavailable"
      redirect_to blog_path
    end
    if current_user
      @comments = @post.comments.all.order(:id)
      if params[:published] == "true"
        @post.update(published: true)
      end
    else
      @comments = @post.comments.where(approved:true).order(:id)
    end

    @comment = @post.comments.new

    if !current_user
      ip_address = IpService.new
      @post.views.create(city: ip_address.detect_city(request.remote_ip), ip_address: request.remote_ip)
    end

    @views = View.all

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :content, :published)
  end
end

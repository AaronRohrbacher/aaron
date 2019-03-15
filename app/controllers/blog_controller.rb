class BlogController < ApplicationController
  def index
    if current_user
      @posts = Post.all
    else
      @posts = Post.where(published: true)
    end
  end
end

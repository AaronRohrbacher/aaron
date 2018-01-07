class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(post_params)
  end

  def post_params
    params.require(:comment).permit(:name, :content)
  end
end

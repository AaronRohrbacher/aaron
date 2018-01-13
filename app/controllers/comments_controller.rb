class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update!(post_params)
    redirect_to edit_post_comment_path(@post, @comment)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(post_params)
    redirect_to edit_post_comment_path(@post, @comment)
  end

  def post_params
    params.require(:comment).permit(:name, :content)
  end
end

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
    if @comment.ip_address == request.remote_ip
      @comment.update(post_params)
      flash[:alert]="Comment posted - edit again if needed!"
      redirect_to edit_post_comment_path(@post, @comment)
    else
      flash[:alert]="Your IP address does not match original comment's IP address. E-mail me if you need your comment updated!"
      redirect_to root_path
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(post_params)
    redirect_to edit_post_comment_path(@post, @comment)
  end

  def post_params
    params.require(:comment).permit(:name, :content, :ip_address)
  end
end

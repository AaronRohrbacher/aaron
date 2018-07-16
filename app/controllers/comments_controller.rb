class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(post_params)
    flash[:notice] = 'Comment submitted for approval. Edit below if need be.'
    redirect_to edit_post_comment_path(@post, @comment)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if params[:approve]
      @comment.update!(approved: true)
      redirect_to post_path(@post)
    end

  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.ip_address == request.remote_ip
      @comment.update(post_params)
      flash[:alert]="Submitted for approval. Edit again if need be."
      redirect_to edit_post_comment_path(@post, @comment)
    else
      flash[:alert]="Your IP address does not match original comment's IP address. E-mail me if you need your comment updated!"
      redirect_to root_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    redirect_to post_path(@comment.post)
  end



  def post_params
    params.require(:comment).permit(:name, :content, :ip_address)
  end
end

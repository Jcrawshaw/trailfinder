class PostsController < ApplicationController
  def index
    @posts = Post.all
    authorize @posts
  end

  def show
    @trail = Trail.find(params[:trail_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @new_comment = Comment.new
    @post_attachments = @post.post_attachments.all
  end

  def new
    @trail = Trail.find(params[:trail_id])
    @post = Post.new
    @post_attachment = @post.post_attachments.build
    authorize @post
  end

def create
    @trail = Trail.find(params[:trail_id])
    @post = current_user.posts.build(params.require(:post).permit(:body, post_attachments_attributes: [:id, :post_id, :gallery]))
    @post.trail = @trail
    @new_post = Post.new
    authorize @post

    if @post.save
      params[:post_attachments]['gallery'].each do |a|
        @post_attachment = @post.post_attachments.create!(:gallery => a, :post_id => @post.id)
      end
      flash[:notice] = "Post was saved!"
      redirect_to @trail
    else
      flash[:error] = "Error creating the post. Please try again."
      render :new
    end
  end

  def edit
  end

  def destroy
    @trail = Trail.find(params[:trail_id])
    @post = @trail.posts.find(params[:id])

    authorize @post
    if @post.destroy
      flash[:notice] = "Post was deleted."
    else
      flash[:notice] = "Error deleting post. Try again."
    end
    redirect_to @trail
  end
end

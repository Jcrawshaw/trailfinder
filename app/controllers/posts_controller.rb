class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @trail = Trail.find(params[:trail_id])
    @post = Post.new
  end

def create
    @trail = Trail.find(params[:trail_id])
    @post = current_user.posts.build(params.require(:post).permit(:body))
    @post.trail = @trail
    @new_post = Post.new
    
    if @post.save
      flash[:notice] = "Post was saved!"
      redirect_to @trail
    else
      flash[:error] = "Error creating the post. Please try again."
      render :new
    end
  end

  def edit
  end
end

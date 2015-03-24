class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(params.require(:comment).permit(:body, :post_id))
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
    else
     flash[:error] = "There was an error saving the comment."
    end
    redirect_to trail_post_path(@post.trail, @post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])


    if comment.destroy
      flash[:notice] = "Comment was deleted"
    else
      flash[:notice] = "Error deleting comment, try again."
    end
    redirect_to trail_post_path(@post.trail, @post)
  end

end


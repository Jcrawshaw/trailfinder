class PostAttachmentsController < ApplicationController

  def create
    post = Post.find params[:post_attachment][:post_id]

    params[:post_attachment]['gallery'].each do |a|
      @post_attachment = post.post_attachments.create!(gallery: a, post_id: post.id)
    end
    post = post_attachment.post
    trail = post.trail
    redirect_to trail_post_path( trail, post)

  end

  def destroy
    post_attachment = PostAttachment.find(params[:id])
    post_attachment.destroy
    post = post_attachment.post
    trail = post.trail
    redirect_to trail_post_path( trail, post)
  end
end
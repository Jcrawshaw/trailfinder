class PostAttachmentsController < ApplicationController

  def create
    post = Post.find params[:post_attachment][:post_id]

    params[:post_attachment]['gallery'].each do |a|
      post.post_attachments.create!(gallery: a, post_id: post.id)
    end
    redirect_to trail_post_path( post.trail, post)
  end

  def destroy
    post_attachment = PostAttachment.find(params[:id])
    post_attachment.destroy
    post = post_attachment.post
    trail = post.trail
    redirect_to trail_post_path( trail, post)
  end
end
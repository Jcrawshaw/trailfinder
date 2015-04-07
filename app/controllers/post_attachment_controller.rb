def update
  if @post_attachment.update(post_attachment_params)
    redirect_to @post_attachment.post, notice: 'Post attachment was successfully updated.'
  end
end
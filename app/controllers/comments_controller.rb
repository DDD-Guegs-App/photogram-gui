class CommentsController < ApplicationController
  def add_row
    @photo_id = params.fetch("input_photo_id")
    @author_id = params.fetch("input_author_id")
    @comment_body = params.fetch("input_body")
    
    c = Comment.new
    c.photo_id = @photo_id
    c.author_id =  @author_id
    c.body = @comment_body

    c.save
    redirect_to("/photos/"+ c.photo_id.to_s)
  end
end
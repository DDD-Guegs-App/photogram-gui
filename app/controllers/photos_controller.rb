class PhotosController < ApplicationController

  def index
    @all_photos = Photo.all.order({ :created_at => :desc })
    
    render({:template => "/photo_templates/list_of_photos.html.erb"})
  end

  def add_row
    @the_image = params.fetch("input_image")
    @the_caption = params.fetch("input_caption")
    @the_owner = params.fetch("input_owner_id")

    p = Photo.new
    p.owner_id = @the_owner
    p.image = @the_image
    p.caption = @the_caption

    p.save
    redirect_to("/photos/"+ p.id.to_s)
    # render({:template => "/user_templates/add_row.html.erb"})
  end

  def details
    @photo_id = params.fetch("a_photo_id")

    results = Photo.all.where(id: @photo_id)
    @photo = results.at(0)

    results = Comment.all.where(photo_id: @photo_id)
    @comments = results

    render({:template => "/photo_templates/photo_detail.html.erb"})
  end
end

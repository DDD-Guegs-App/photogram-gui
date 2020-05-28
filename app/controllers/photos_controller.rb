class PhotosController < ApplicationController

  def index
    @all_photos = Photo.all.order({ :id => :asc })
    
    render({:template => "/photo_templates/list_of_photos.html.erb"})
  end

  def details
    @photo_id = params.fetch("photo_id")

    render({:tempalte => "/photo_templates/photo_detail.html.erb"})

  end
end

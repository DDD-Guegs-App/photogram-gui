class UsersController < ApplicationController

  def index
    @all_users = User.all.order({ :username => :asc })
    
    render({:template => "/user_templates/list_of_users.html.erb"})
  end

  def add_row
    @the_un = params.fetch("input_username")

    u = User.new
    u.username = @the_un

    u.save
    redirect_to("/users/"+u.username)
    # render({:template => "/user_templates/add_row.html.erb"})
  end

  def update
    @the_un = params.fetch("input_username")
    @u_id = params.fetch("a_user_id")

    u = User.where({ :id => @u_id}).first
    u.username = @the_un
    u.save
    redirect_to("/users/"+u.username)
  end

  def details
    @a_username = params.fetch("username")
    results = User.all.where(username: @a_username)
    @user = results.at(0)

    results = Photo.all.where(owner_id: @user.id)
    @all_photos = results

    @number_photos = @all_photos.count

    render({:template => "/user_templates/user_detail.html.erb"})
  end
end

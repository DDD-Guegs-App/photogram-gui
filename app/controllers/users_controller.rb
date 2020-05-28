class UsersController < ApplicationController

  def index
    @all_users = User.all
    
    render({:template => "/user_templates/list_of_users.html.erb"})
  end
end

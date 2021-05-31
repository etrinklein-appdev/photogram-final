class UsersController < ApplicationController

  def index
    all_users = User.all
    @list_of_users = all_users.order({ :username => :asc })


    render({ :template => "users/index.html.erb" })
  end

  def details
    username = params.fetch("username")

    matching_users = User.where({ :username => username })
    @the_user = matching_users.at(0)

    @list_of_photos = @the_user.photos.all

    render({ :template => "users/show.html.erb" })

  end

end

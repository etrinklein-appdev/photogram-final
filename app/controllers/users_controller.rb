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

  def liked_photos

    username = params.fetch("username")

    matching_users = User.where({ :username => username })

    @the_user = matching_users.at(0)

    @liked_photos =  @the_user.likes.all

    render({ :template => "users/liked_photos.html.erb" })

  end

  def feed

    username = params.fetch("username")

    matching_users = User.where({ :username => username })

    @the_user = matching_users.at(0)

    @following = @the_user.followrequests.where(:status => "accepted")

    render({ :template => "users/feed.html.erb" })

  end

    def discover

    username = params.fetch("username")

    matching_users = User.where({ :username => username })

    @the_user = matching_users.at(0)

    @following = @the_user.followrequests.where(:status => "accepted")

    render({ :template => "users/discover.html.erb" })

  end

end

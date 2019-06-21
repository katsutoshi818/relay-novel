class UsersController < ApplicationController

  def show
    @titles = User.find(current_user.id).titles
  end
end

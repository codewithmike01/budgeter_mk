class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(current_user.id)
    @groups = Group.where(user_id: current_user.id)
  end
end

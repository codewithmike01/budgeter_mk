class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
    @groups = Group.where(user_id: params[:id])
  end
end

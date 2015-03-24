class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:notice] = "Information was not updated. Try again."
      redirect_to edit_user_registration_path
    end
  end

  def show
    @favorited_trails = current_user.favorited_trails
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
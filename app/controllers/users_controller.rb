class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redilect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :about)
  end
end

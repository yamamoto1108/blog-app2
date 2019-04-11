class UsersController < ApplicationController
  def show
    @name = current_user.name
    @about = current_user.about
    #@posts = Post.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
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

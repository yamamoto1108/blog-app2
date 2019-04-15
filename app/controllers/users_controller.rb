class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = @user.name
    @about = @user.about
    @avatar = @user.avatar
    @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
    @tags = Tag.all
  end

  def edit
    @tags = Tag.all
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :about)
  end
end

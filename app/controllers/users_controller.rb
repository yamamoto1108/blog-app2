class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = @user.name
    @about = @user.about
    @image = @user.image
    @posts = @user.posts.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    @tags = Tag.all
  end

  def edit
    @tags = Tag.all
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path, notice: "更新しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :about, :image)
  end
end

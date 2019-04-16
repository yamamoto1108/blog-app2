class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    @tags = Tag.all
  end
end

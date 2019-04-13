class LikesController < ApplicationController
  before_action :set_variables
  
  def create
    @like = Like.new(user_id: @current_user.id, post_id: @post.id)
    @like.save
  end

  def destroy
    @like = Like.find_by(user_id: @current_user.id, post_id: @post.id)
    @like.destroy
  end

 
end

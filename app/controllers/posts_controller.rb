class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(5).order("created_at DESC")
    @tags = Tag.all
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
      flash[:success] = "投稿しました"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @tags = Tag.all
  end

  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(post_params)
      redirect_to post_path
      flash[:success] = "更新しました"
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
      redirect_to root_path, notice: "削除しました"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @tags = Tag.all
  end

  def search
    @posts = Post.search(params[:search]).page(params[:page]).per(5).order("created_at DESC")
    @tags = Tag.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image, tag_ids: []).merge(user_id: current_user.id)
  end
end

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @post.user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path method: :get
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id != current_user.id
      redirect_to root_path
    end
    post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :describe, :favorite_scene, :favorite_character, :spoiler).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end

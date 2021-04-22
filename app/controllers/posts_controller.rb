class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  helper SiteHelper
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index

    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

module SiteHelper
  def post_user_email(post)
    post.user.email if user_signed_in?
  end
end

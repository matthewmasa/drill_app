#frozen_string_literal: true

class PostsController < ApplicationController
 before_action :set_post, only[:edit, :show]
 before_action :move_to_index, only[:index, :show]

  def index
    @posts= Post.all
  end

  def new
    @posts= Post.new
  end

  def create
    @post= Post.new(post_params)
  end

  def destroy
    @post=Post.find_by(params[:id])
    @post.destroy
  end

 private
  def post_params
    params.require(:post).permit(:image,:text,:name)
  end

  def set_post
    @post=Post.find_by(params[:id])
  end

  def move_to_index
    unless
      user_sigined_in?
     redirect_to action: :index
    end
  end
end

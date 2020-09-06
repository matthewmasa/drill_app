#frozen_string_literal: true

class PostsController < ApplicationController
 before_action :set_post, only: [:edit, :show]
 before_action :move_to_index, except: :index

  def index
    @posts= Post.all
  end

  def new
    @post= Post.new
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
    params.require(:post).permit(:image,:text,:name).merge(user_id: current_user.id)
  end

  def set_post
    @post=Post.find_by(params[:id])
  end

  def move_to_index
    unless
      user_signed_in?
     redirect_to action: :index
    end
  end
end

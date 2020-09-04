#frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only[:show, :edit]

  def index
    @posts= Post.all
  end

  def new
    @posts= Post.new
  end

  def create
    @post= Post.new(post_params)
  end

  def edit
  end

  def update
    @post=Post.find_by(params[:id])
    @post.update(post_params)
  end

  def show
  end

  def destroy
    @post=Post.find_by(params[:id])
    @post.destroy
  end

 private
  def post_params
    params.require(:post).permit(:image,:text,:name)
  end
end

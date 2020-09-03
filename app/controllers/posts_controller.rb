#frozen_string_literal: true

class PostsController < ApplicationController

  def index
    @posts= Post.all
  end

  def new
    @posts= Post.new
  end

  def create
    @post= Post.new(post_params)
  end

 private
  def post_params
    params.require(:post).permit(:image,:text,:name)
  end
end

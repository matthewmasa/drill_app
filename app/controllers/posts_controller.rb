#frozen_string_literal: true

class PostsController < ApplicationController

  def index
    @posts= Post.all
  end

  def new
    @posts= Post.new
  end

  def create
    @post= Post.new(memo:[:memo])
  end

 private
  def post_params
    params.require(:post).permit(:memo)
  end
end

class PostsController < ApplicationController

  def show
    @post = Post.new
  end
end

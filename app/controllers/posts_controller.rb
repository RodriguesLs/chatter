# frozen_string_literal: true

# Post class
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end

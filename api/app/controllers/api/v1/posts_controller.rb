# frozen_string_literal: true

class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  def index
    render json: Post.order(created_at: :desc).all
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)

    if @post.invalid?
      render(json: @post.errors, status: :unprocessable_entity)
    else
      @post.save!
      render json: @post, status: :created
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Post does not exist' }, status: :not_found
  end

  def post_params
    params.permit(:title, :body)
  end
end

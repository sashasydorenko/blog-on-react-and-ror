class Api::PostsController < ApiController
  before_action :set_post, only: [:update, :destroy]

  def index
    json_response Post.includes(:category).all
  end

  def search
    json_response Post.includes(:category).search(params[:query])
  end

  def create
    json_action Post.create(post_params)
  end

  def update
    @post.update(post_params)
    json_action @post
  end

  def destroy
    json_action @post.destroy
  end

  private

  def post_params
    params.permit(:name, :content, :file, :category_id)
  end

  def set_post
    @post ||= Post.find(params[:id])
  end
end

class Api::PostsController < ApiController
  def index
    json_response Post.includes(:category).all
  end

  def search
    json_response Post.includes(:category).search(params[:query])
  end

  def create
    json_action Post.create(post_params)
  end

  def destroy
    json_action Post.find(params[:id]).destroy
  end

  private

  def post_params
    params.permit(:name, :content, :file, :category_id)
  end
end

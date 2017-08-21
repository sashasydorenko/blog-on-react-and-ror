class Api::PostsController < ApiController
  def index
    render json: Post.includes(:category).all
  end

  def search
    render json: Post.includes(:category).search(params[:query])
  end

  def destroy
    # for testing
    render json: Post.find(params[:id])
  end
end

class Api::PostsController < ApiController
  def index
    json_response Post.includes(:category).all
  end

  def search
    json_response Post.includes(:category).search(params[:query])
  end

  def destroy
    json_action Post.find(params[:id]).destroy
  end
end

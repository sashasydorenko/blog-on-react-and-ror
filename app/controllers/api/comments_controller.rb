class Api::CommentsController < ApiController
  def index
    render json: Comment.for_post(params[:post_id])
  end

  def destroy
    render json: Comment.find(params[:id]).destroy
  end
end

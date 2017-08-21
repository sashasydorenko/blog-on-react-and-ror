class Api::CommentsController < ApiController
  def index
    json_response Comment.for_post(params[:post_id])
  end

  def create
    json_action Comment.create(comment_params)
  end

  def destroy
    json_action Comment.find(params[:id]).destroy
  end

  private

  def comment_params
    params.permit(:author, :content, :post_id)
  end
end

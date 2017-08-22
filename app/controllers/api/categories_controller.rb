class Api::CategoriesController < ApiController
  def index
    json_response Category.all
  end

  def destroy
    json_action Category.find(params[:id]).destroy
  end
end

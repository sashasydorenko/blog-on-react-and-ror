class Api::CategoriesController < ApiController
  def index
    json_response Category.all
  end

  def create
    json_action Category.create(category_params)
  end

  def destroy
    json_action Category.find(params[:id]).destroy
  end

  private

  def category_params
    params.permit(:name, :description)
  end
end

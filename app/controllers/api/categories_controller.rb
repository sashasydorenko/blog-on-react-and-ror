class Api::CategoriesController < ApiController
  def destroy
    render json: Category.find(params[:id]).destroy
  end
end

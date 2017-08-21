class Api::SidebarController < ApiController
  def categories
    categories = Category.all
    render json: categories
  end

  def tags
    render json: []
  end
end

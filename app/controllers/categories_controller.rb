class CategoriesController < ApplicationController
    before_action :require_admin_user, only: [:create, :new]
  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  def create

      @category = Category.new(category_params)
      if @category.save
        flash[:notice] = 'Category was successfully created'
        redirect_to category_path(@category)
      else
        render :new
      end
  end
  private
  def category_params
    params.require(:category).permit(:name)
  end
  def require_admin_user
      unless logged_in? && current_user.admin? 
        flash[:alert] = 'only Admin users could create new categories'
        redirect_to categories_path
      end
  end
end


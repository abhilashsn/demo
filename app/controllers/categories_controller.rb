class CategoriesController < ApplicationController
  
  def index
    @categories = current_user.categories
  end
  
  def new
    @category = Category.new
  end
    
  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    respond_to do |format|
      if @category.save
        format.js
      end
    end
   end
  
  def edit
    @category = Category.find(params[:id])
  end
    
  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update_attributes(category_params)
        format.js
      end
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.js
    end
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
  
end


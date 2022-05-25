class CategoriesController < ApplicationController
  def new
    @category = Category.all
  end

  def create
    @category = Category.new(
      name: allowed_params[:name],
      amount: allowed_params[:amount],
      user_id: current_user.id
    )

    if @category.save
      save_cat_group(@category)
      redirect_to user_group_path(current_user.id, params[:group_id]), notice: 'Successfully created Category spending'
    else
      render 'new', alert: 'Category group failed to create'
    end
  end

  private

  def save_cat_group(category)
    @category_group = CategoryGroup.create!(
      category_id: category.id,
      group_id: params[:group_id]
    )
  end

  def allowed_params
    params.require(:category).permit(:name, :amount)
  end
end

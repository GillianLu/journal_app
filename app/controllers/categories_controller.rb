class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
    @tasks_for_today = @category.tasks.where(deadline: Date.today.all_day)
    @tasks_for_tomorrow = @category.tasks.where('deadline >= ? AND deadline < ?', Date.tomorrow.beginning_of_day, 2.days.from_now.beginning_of_day)
    @tasks_for_this_week = @category.tasks.where(deadline: Date.today.beginning_of_day..1.week.from_now.end_of_day)
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = current_user.categories.find(params[:id])
  end

  def update
    @category = current_user.categories.find(params[:id])

    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy

    redirect_to categories_path, notice: 'Category was successfully deleted!', status: :see_other
  end

  private

    def category_params
      params.require(:category).permit(:title, :description)
    end
end

class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy ]

  def index
    @categories = current_user.categories
  end

  def show
    @tasks_for_today = @category.tasks.today
    @tasks_for_tomorrow = @category.tasks.tomorrow
    @tasks_for_this_week = @category.tasks.this_week
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
  end

  def update

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

    def set_category
      @category = current_user.categories.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title, :description)
    end
end

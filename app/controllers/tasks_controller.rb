class TasksController < ApplicationController
  before_action :set_category
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_completion]

  def new
    @task = @category.tasks.build
  end

  def show
    @tasks_for_today = @category.tasks.today
    @tasks_for_tomorrow = @category.tasks.tomorrow
    @tasks_for_this_week = @category.tasks.this_week
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save
      redirect_to category_path(@category), notice: 'Task was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = @category.tasks.find(params[:id])
  end

  def update
    if @task.update(task_params)
      redirect_to category_path(@category)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to category_path(@category), status: :see_other
  end

  def toggle_completion
    if @task.toggle_completion
      redirect_to category_path(@task_category_id), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  private
  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline, :completed)
  end

end

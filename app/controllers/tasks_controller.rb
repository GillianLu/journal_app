class TasksController < ApplicationController
  before_action :set_category
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_completion]

  def new
    @task = @category.tasks.build
  end

  def show
    @tasks_for_today = @category.tasks.where(deadline: Date.today.all_day)
    @tasks_for_tomorrow = @category.tasks.where(deadline: Date.tomorrow.all_day)
    @tasks_for_this_week = @category.tasks.where(deadline: Date.today.all_day..1.week.from_now.all_day)
  end

  def create
    @category = Category.find(params[:category_id])
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
    @task = @category.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to category_path(@category)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path(@category), status: :see_other
  end

  def toggle_completion
    @task = Task.find(params[:id])
    @task.completed = !@task.completed

    respond_to do |format|
      if @task.save
        format.html { redirect_to category_path(@task.category_id), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def set_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline, :completed)
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  end
end

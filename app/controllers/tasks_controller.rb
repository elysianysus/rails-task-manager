class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
  end

  def edit
  end

  def update
    @task.update(task_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

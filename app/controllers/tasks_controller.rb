class TasksController < ApplicationController
  before_action :set_task, only: %i[ show ]

  def index
    @tasks = Task.includes(:family_member)

    @pagy, @tasks = pagy(@tasks)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: "Task was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :family_member_id)
    end
end

class Tasks::StatusController < ApplicationController
  before_action :set_task, only: %i[update]

  def update
    @task.complete!
    respond_to do |format|
      format.html { redirect_to request.referer, notice: "Task was marked as complete." }
    end
  end

  private
    def set_task
      @task = Task.find(params[:task_id])
    end
end

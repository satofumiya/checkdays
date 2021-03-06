class Api::TasksController < ApplicationController
  def index
    @goal = Goal.find_by(id: params[:goal_id])
    @subgoal = Subgoal.find_by(id: params[:subgoal_id])
    @tasks = Task.where(subgoal_id: @subgoal.id).order("id DESC")
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render :show, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  def update
    @task = Task.find_by(id: params[:id])
    @task.update(task_params)
  end

  private

  def task_params
    params.permit(:title,:done, :subgoal_id,:task)
  end
end

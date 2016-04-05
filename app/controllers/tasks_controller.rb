class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params["id"])
  end

  def update
    @task = Task.find(params["id"])
    @task.status = params[:status]
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new
    @task.body = params[:task][:body]
    if params[:task][:position]
      @task.position = params[:task][:position]
      Task.slide_down(params[:task][:position].to_i)
    else
      @task.position = Task.count + 1
    end
   if @task.save
     redirect_to task_path(@task.id), notice: "Success!"
   else
     flash[:alert] = "Error Occured! Link couldn't be created!"
     render :new
   end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end
end

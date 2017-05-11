class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :update, :show, :destroy]


    def new
      @task = Task.new
    end

    def create
      @task = current_user.tasks.new(tasks_params)
      if @task.save
        flash[:notice] = "Task was succesfully created"
        redirect_to task_path(@task)
      else
        render 'new'
      end
    end

    def edit
        #@task = Task.find(params[:id])

    end

    def update
        #@task = Task.find(params[:id])
        if @task.update(tasks_params)
          flash[:notice] = "Task was succesfully updatedd"
          redirect_to task_path(@task)
        else
          render 'edit'
        end
    end

    def show
      #@task = Task.find(params[:id])
    end

    def index
      @to_do = current_user.tasks.where(state: 'to_do')
      @doing = current_user.tasks.where(state: 'doing')
      @done = current_user.tasks.where(state: 'done')
    end

    def destroy
      #@task = Task.find(params[:id])
      @task.destroy
      flash[:notice] = "Task was succesfully deleted"
      redirect_to tasks_path
    end





    private

    def set_task
        @task = Task.find(params[:id])
      end

    def tasks_params
      params.require(:task).permit(:content, :state)

    end

  end

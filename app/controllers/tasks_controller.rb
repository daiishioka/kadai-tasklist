class TasksController < ApplicationController
	before_action :require_user_logged_in, except: [:index]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

	def index
	  if logged_in?
	  	@task = current_user.tasks.build
	    @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
	  end
	end
  
  def show
  end
  
  def new
  	@task = Task.new
  end
  
  def create
  	@task = current_user.tasks.build(task_params)
  	
  	if @task.save
  		flash[:success] = 'TODOさんが正常に作成されました'
  		redirect_to root_url
  	else
  		flash.now[:danger] = 'TODOさんは作成されませんでした'
  		render :new
  	end
  	
  end
  
  def edit
  end
  
  def update
  	if @task.update(task_params)
  		flash[:success] = 'TODOさんは正常に更新されました'
  		redirect_to @task
  	else
  		flash.now[:danger] = 'TODOさんは更新されませんでした'
  		render :edit
  	end
  end
  
  def destroy
  	@task.destroy
  	
  	flash[:success] = 'TODOさんは正常に削除されました'
  	redirect_to root_url
  end
  
	private
	
	def set_task
	  @task = Task.find(params[:id])
	end
	  
	def task_params
		params.require(:task).permit(:content, :status)
	end
end

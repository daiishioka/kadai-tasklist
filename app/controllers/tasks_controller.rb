class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
	def index
	  if logged_in?
	    @taskpost = current_user.taskposts.build
	    @taskposts = current_user.taskposts.order('created_at DESC').page(params[:page])
	  end
		@tasks = Task.all
	end
  
  def show
  end
  
  def new
  	@task = Task.new
  end
  
  def create
  	@task = Task.new(task_params)
  	
  	if @task.save
  		flash[:success] = 'TODOさんが正常に作成されました'
  		redirect_to "/"
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
  	redirect_to tasks_url
  end
  
	private
	
	def set_task
	  @task = Task.find(params[:id])
	end
	  
	def task_params
		params.require(:task).permit(:content, :status)
	end
end

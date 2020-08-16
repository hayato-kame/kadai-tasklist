class TasksController < ApplicationController
  
  # before_action を使用することでまとめることが可能
  # before_action は、アクションが実行される前に、前もって実行すべきメソッドを指定できます。
  # 今回は set_task メソッドをアクション実行前に実行されるように指定しました。
  # また、only: [...] によって、set_task を前もって実行するアクション一覧を指定してます。
  # このおかげで、show, edit, update, destroy が実行される前に必ず set_task を実行することになり、
  # @task = Task.find(params[:id]) として代入されます。
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
    # set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end

  def edit
    # @task = Task.find(params[:id])
    # set_task
  end

  def update
    # @task = Task.find(params[:id])
    # set_task
    
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    # @task = Task.find(params[:id])
    # set_task
    @task.destroy
    
    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end
  
  
  
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  #Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end

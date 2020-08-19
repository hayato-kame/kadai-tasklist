class TasksController < ApplicationController
  
 before_action :require_user_logged_in, only: [:index, :show]
 
 before_action :set_task, only: [:show, :edit, :update, :destroy]
 
 before_action :correct_user, only: [:show, :update, :destroy]  
  
  
  def index
      @tasks = current_user.tasks.order(id: :desc)
  end

  def show
  end

  def new
    
      @task = current_user.tasks.build 
    
  end

  def create
    @task = current_user.tasks.build(task_params)#認証したログインしてるセッションスコープにあるユーザーＩＤの
    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end
  

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
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
  
  # 誰もが勝手に他者の投稿を削除/更新ができないようにするための対処
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task  # 見つからない　nil が入ってる
      redirect_to root_url # トップページに戻されます。
    end
  end
 
end

class TasksController < ApplicationController
  
  # before_action を使用することでまとめることが可能
  # before_action は、アクションが実行される前に、前もって実行すべきメソッドを指定できます。
  # 今回は set_task メソッドをアクション実行前に実行されるように指定しました。
  # また、only: [...] によって、set_task を前もって実行するアクション一覧を指定してます。
  # このおかげで、show, edit, update, destroy が実行される前に必ず set_task を実行することになり、
  # @task = Task.find(params[:id]) として代入されます。
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
   before_action :require_user_logged_in, only: [:index, :show]
   
  
   
  
#   require_user_logged_in はログイン状態を確認し、
#   ログインしていれば何もせず、
#   ログインしていなければログインページへ強制的にリダイレクトさせます。
#   これで、ログインしていないユーザに 
# tasks#index とtasks#show を見られることはありません
  
  def index
    if logged_in?
 #   @tasks = Task.all
      @tasks = current_user.tasks.order(id: :desc)
    end
  end

  def show
    # @task = Task.find(params[:id])
  
    # set_task
  end

  def new
    if logged_in?
 #   @task = Task.new
      @task = current_user.tasks.build  # form_with用　　投稿するフォームを設置するので
    # form_with(model: @micropost) として使用します
    end
  end

  def create
 #   @task = Task.new(task_params)
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

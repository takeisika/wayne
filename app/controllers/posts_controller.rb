class PostsController < ApplicationController
  def index
    @tasks=Task.all
  end

  def new
  end

  def create
    @task=Task.new(content: params[:task])
    @task.save
    redirect_to("/posts/index")
  end

  def show
    @task=Task.find_by(id: params[:id])
  end

  def edit
    @task=Task.find_by(id: params[:id])
  end

  def update
    @task=Task.find_by(id: params[:id])
    @task.content=params[:update]
    @task.save
    flash[:notice]="編集完了"
    redirect_to("/posts/index")
  end

  def destroy
    @task=Task.find_by(id: params[:id])
    @task.destroy
    flash[:notice]="削除完了"
    redirect_to("/posts/index")
  end
end

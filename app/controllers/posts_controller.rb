class PostsController < ApplicationController
  def index
    @tasks=Task.all
  end

  def create
    @task=Task.new(content: params[:task], status: params[:status])
    if @task.save
    redirect_to("/posts/index")
    else
      @error_messages="タスクは255文字以内、ステータスは10文字以内で記入してください。"
      render("posts/_form")
    end
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
    @task.status=params[:updatestatus]
    if @task.save
    flash[:notice]="編集完了"
    redirect_to("/posts/index")
    else
      @error_messages="!タスクは255文字以内、ステータスは10文字以内で記入してください。"
      render("posts/edit")
    end
  end

  def destroy
    @task=Task.find_by(id: params[:id])
    @task.destroy
    flash[:notice]="削除完了"
    redirect_to("/posts/index")
  end

  def _form
  end
end

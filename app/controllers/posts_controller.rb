class PostsController < ApplicationController
  def index
    @tasks=Task.all
  end

  def _form
    @task=Task.new
  end

  def create
    @task=Task.new(content: params[:task], status: params[:status],user_id:@current_user.id)
    if @task.save
      redirect_to("/posts/index")
    else
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
      render("posts/edit")
    end
  end

  def destroy
    @task=Task.find_by(id: params[:id])
    @task.destroy
    flash[:notice]="削除完了"
    redirect_to("/posts/index")
  end

end

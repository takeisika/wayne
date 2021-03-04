class CommentsController < ApplicationController
  before_action:check,{only:[:edit,:update,:destroy]}

  def edit
    @comment=Comment.find_by(id: params[:id])
  end

  def update
    @comment=Comment.find_by(id: params[:id])
    @comment.content=params[:commentupdate]
    if @comment.save
      redirect_to("/posts/index")
    end
  end

  def destroy
    @comment=Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:notice]="削除完了"
    redirect_to("/posts/index")
  end


  def check
    @comment=Comment.find_by(id:params[:id])
    if @comment.user_id!=@current_user.id
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end
end

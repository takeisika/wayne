class LikesController < ApplicationController
  def create
    @task = Task.find_by(id: params[:post_id])
    @like=Like.new(user_id:@current_user.id,post_id:params[:post_id])
    if @like.save
      flash[:notice]="いいねしました"
  
    end
  end

  def destroy
    @task = Task.find_by(id: params[:post_id])
    @like=Like.find_by(user_id:@current_user.id,post_id:params[:post_id])
    if @like.destroy
      flash[:notice]="いいねを取り消しました"
      
    end
  end
end

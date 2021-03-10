class LikesController < ApplicationController
  before_action:ensuring,{only:[:destroy]}
  def create
    @task = Task.find_by(id: params[:post_id])
    @like=Like.new(user_id:@current_user.id,post_id:params[:post_id])
    @like.save
  end

  def destroy
    @task = Task.find_by(id: params[:post_id])
    @like=Like.find_by(user_id:@current_user.id,post_id:params[:post_id])
　　 @like.destroy
  end
end

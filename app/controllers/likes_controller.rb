class LikesController < ApplicationController
  def create
    @like=Like.new(user_id:@current_user.id,post_id:params[:post_id])
    if @like.save
      flash[:notice]="いいねしました"
    redirect_to("/posts/index")
    end
  end

  def destroy
    @like=Like.find_by(user_id:@current_user.id,post_id:params[:post_id])
    if @like.destroy
      flash[:notice]="いいねを取り消しました"
    redirect_to("/posts/index")
    end
  end
end

class FollowsController < ApplicationController
  before_action:ensuring


  def create
    @user=User.find_by(id: params[:followed_id])
    @follow=Follow.new(following_id: @current_user.id,followed_id: params[:followed_id])
    if @follow.save
      flash.now[:notice]="フォローしました"
    end
  end


  def destroy
    @user=User.find_by(id: params[:followed_id])
    @follow=Follow.find_by(following_id: @current_user.id,followed_id: params[:followed_id])
    if @follow.destroy
      flash.now[:notice]="フォローを外しました"
    end
  end
 
end

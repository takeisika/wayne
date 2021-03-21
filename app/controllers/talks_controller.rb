class TalksController < ApplicationController
  before_action:ensuring
  before_action:talk_ensure

  def show
    @user=User.find_by(id:params[:your_id])
  end

  def create
    @user=User.find_by(id:params[:your_id])
    @talk=Talk.new(content:params[:content],my_id:@current_user.id,your_id:params[:your_id])
    @talk.save        
  end


  def talk_ensure
    if @current_user.id==params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end



end

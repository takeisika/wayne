class TalksController < ApplicationController
  before_action:talk_ensure

  def show
    @user=User.find_by(id:params[:your_id])
    @talks=Talk.all
  end

  def create
    @talk=Talk.new(content:params[:content],my_id:@current_user.id,your_id:params[:your_id])
    if @talk.save
      redirect_to("/talks/#{@talk.your_id}")
    end
  end


  def talk_ensure
    if @current_user.id!=params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end



end

class LikecommentsController < ApplicationController
  def create
    @comment = Comment.find_by(id: params[:comment_id])
    @likecomment=Likecomment.new(user_id:@current_user.id,comment_id:params[:comment_id])
    @likecomment.save
  end

  def destroy
    @comment = Comment.find_by(id: params[:comment_id])
    @likecomment=Likecomment.find_by(user_id:@current_user.id,comment_id:params[:comment_id])
    if @likecomment
      @likecomment.destroy
    end
  end
end

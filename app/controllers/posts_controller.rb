class PostsController < ApplicationController
  before_action:ensuring,{only:[:edit,:update,:destroy,:come]}
  before_action:postensure,{only:[:edit,:update,:destroy]}

  def index
    @posts=Post.all
  end

  def _form
    @post=Post.new
  end


  def create
    @post=Post.new(post_params)

    @post.save


      if @post.files.count>4
        @post.destroy
        render("posts/_form")
      else
        redirect_to("/posts/index")
      end

  end

  
  def show
    @post=Post.find_by(id: params[:id])
  end

  def edit
    @post=Post.find_by(id: params[:id])
  end

  def update
    @post=Post.find_by(id: params[:id])

    if @post.update(post_params)
    flash[:notice]="編集完了"
    redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post=Post.find_by(id: params[:id])
    @post_id=@post.id
    @post.destroy
    @likes=Like.where(post_id: params[:id],user_id: @current_user.id)
    @likes.destroy_all
    flash.now[:notice]="削除完了"
    
  end

  def postensure
    @post=Post.find_by(id:params[:id])
    if @post.user_id!=@current_user.id
      flash[:notice]="権限がありません"
      redirect_to("users/login_form")
    end
  end

  def comment
    @post=Post.find_by(id: params[:id])
  end

  def come
    @comment=Comment.new(comment_id: params[:id],content: params[:content],user_id:@current_user.id)
    if @comment.save
      redirect_to("/posts/#{@comment.comment_id}/comment")
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:content,:tube,files: [],movies: []).merge(user_id:@current_user.id)
  end
end

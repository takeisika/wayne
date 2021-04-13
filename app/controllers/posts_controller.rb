class PostsController < ApplicationController
  before_action:ensuring,{only:[:edit,:update,:destroy,:come]}
  before_action:postensure,{only:[:edit,:update,:destroy]}

  def index

  end

  def _form
    @post=Post.new
  end


  def create
    @post=Post.new(post_params)

    if @post.save
      flash[:notice]="投稿しました"


      if @post.files.count>4
        @post.destroy
        render("posts/_form")
      else
        redirect_to("/follows/index")
      end

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
    flash[:notice]="編集しました"
    redirect_to("/follows/index")
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
    @tags=Hashtag.where(post_id: @post.id)
    @tags.destroy_all
    flash.now[:notice]="削除しました"
    
  end

  def destroy_at_comment
    @post=Post.find_by(id: params[:id])
    @post.destroy
    @likes=Like.where(post_id: params[:id],user_id: @current_user.id)
    @likes.destroy_all
    flash[:notice]="削除しました"
    redirect_to("/follows/index")
  end

  def postensure
    @post=Post.find_by(id:params[:id])
    if @post.user_id!=@current_user.id
      flash[:notice]="権限がありません"
      redirect_to("/users/login_form")
    end
  end

  def comment
    @post=Post.find_by(id: params[:id])
  end

  def come
    @post=Post.find_by(id: params[:id])
    @comment=Comment.new(comment_id: params[:id],content: params[:content],user_id:@current_user.id)
    @comment.save
  end


  def search_form
    if params[:hashsearch].present?&&params[:hashsearch]!=""""&&params[:hashsearch]!="#"
      @hashtags = Hashtag.where(['hashname LIKE ?', "%#{params[:hashsearch]}%"])
      if @hashtags.count<=1
        flash.now[:alert]="検索結果なし"
      end
    elsif params[:hashsearch]==""""
      flash.now[:alert]="検索結果なし"
    elsif params[:hashsearch]=="#"
      flash.now[:alert]="検索結果なし"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title,:content,:tube,:tag,files: [],movies: []).merge(user_id:@current_user.id)
  end

  
end

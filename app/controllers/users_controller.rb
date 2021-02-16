class UsersController < ApplicationController

  def index
    @users=User.all
  end

  def show
    @user=User.find_by(id: params[:id])
    @tasks=Task.where(user_id: params[:id])
  end

  def create
    @user=User.new(name: params[:username],password: params[:password],image_name: "default.jpg")
    @user.save
    session[:user_id]= @user.id
    redirect_to("/users/#{@user.id}")
  end


  def edit
    @user=User.find_by(id:params[:id])
  end

  def update
    @user=User.find_by(id:params[:id])
    @user.name=params[:username]
    @user.image_name="#{@user.id}.jpg"
    image=params[:image]
    if @user.save
    File.binwrite("public/user_images/#{@user.image_name}",image.read)
    flash[:notice]="編集しました"
    redirect_to("/users/#{@user.id}")
    end
  end


  def login_form
  end

  def login
    @user=User.find_by(name: params[:username],password: params[:password])
    if @user
      session[:user_id] =@user.id
      redirect_to("/")
      flash[:notice]="ログインしました。"
    else
      render("users/login_form")
    end
  end

  def logout
    session[:user_id]=nil
    render("users/login_form")
  end
end

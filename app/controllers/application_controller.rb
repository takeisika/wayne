class ApplicationController < ActionController::Base
before_action:set_current_user
    def set_current_user
        @current_user=User.find_by(id: session[:user_id])
    end

    def ensure
        if @current_user
            flash[:notice]="すでにログインしています"
            redirect_to("/posts/index")
        end
    end

    def ensuring
        if @current_user==nil
            flash[:notice]="ログインが必要です"
            redirect_to("/users/login_form")
        end
    end

    def ensured
        if @current_user.id!=params[:id].to_i
            flash[:notice]="権限がありません"
            redirect_to("/posts/index")
        end
    end

end

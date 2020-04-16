class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    def new
        if logged_in?
            flash[:notice] = 'User is already logged in'
            redirect_to me_path
        else
            @user = User.new
        end
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to me_path
        else
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end

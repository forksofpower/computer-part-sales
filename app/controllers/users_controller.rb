class UsersController < ApplicationController
    before_action :find_user, except: [:index, :new, :create, :show_me]
    skip_before_action :authorized, only: [:new, :create]

    def index
        @users = User.all
    end

    def show
    end

    def show_me
        @user = current_user
        render :show
    end

    def new
        @user = User.new
    end

    def edit
    end

    def create
        @existing_user = User.find_by(username: params[:username])
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Login Successful"
            redirect_to root_path
        else
            flash[:error] = "Something went wrong"

            render 'new'
        end
    end

    def update
        if @user.update_attributes(user_params)
            flash[:success] = "User was successfully updated"
            redirect_to @user
        else
            flash[:error] = "Something went wrong"
            render 'edit'
        end
    end

    def destroy
        if @user.destroy
            flash[:success] = "User was successfully deleted"
            redirect_to users_path
        else
            flash[:error] = "Something went wrong"
            redirect_to users_path
        end
    end

    def page_to_protect
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :username, :password)
        end

        def find_user
            @user = User.find(params[:id])
        end
end
class UsersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:index, :show]
    before_action :logged_in_user, only: [:index, :show]
    #loading the signup form
    def index
        @users = User.all
    end 
    def new
        @user = User.new
    end 

    def show
        @user = User.find(params[:id])
    end 
    #signup
    

    def create
        @user = User.new(user_params)
        if @user.save
            #login the user
            login @user
            redirect_to @user
        else
            render :new 
        end 
    end 

    private 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end  

    def redirect_if_not_logged_in
        redirect_to login_url if !logged_in?
    end

    def logged_in_user
        @user = User.find(params[:id])
        redirect_to root_url if !is_current_user?(@user)
    end 
end

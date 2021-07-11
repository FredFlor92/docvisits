class SessionsController < ApplicationController
    
    def new
    end 

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:error] = "Sorry, your username or password was invalid"
            render :new
        end 
    end

    def home

    end 

    #logout
    def destroy
        session.clear
        redirect_to '/'
    end 
end

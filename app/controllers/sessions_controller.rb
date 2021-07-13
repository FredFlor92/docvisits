class SessionsController < ApplicationController
    
    def new
    end 

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            login @user
            redirect_to @user
        else
            flash[:error] = "Sorry, your username or password was invalid"
            render :new
        end 
    end

    def fbcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = auth['uid']
        end 
        login @user

        redirect_to '/docvisits'
    end 

    def home

    end 

    #logout
    def destroy
        session.clear
        redirect_to '/'
    end 

    private 

    def auth
        require.env['omniauth.auth']
    end 
end

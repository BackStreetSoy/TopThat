class UsersController < ApplicationController
    respond_to :json, :html
    
    def index 
        @users = User.all 
        @hello = "toby"
    end 

    def new
        @user = User.new 
    end 
    def create 
        @user = User.new(user_params)
        if @user.save
            login(@user)
        else 
            flash[:error] = "incorrect email or password"
            redirect_to root_path
        end 
    end


    private 

    def user_params 
        params.require(:user).permit(:username, :email, :password, :about_me, :wins, :losses, :ties)
    end 
end

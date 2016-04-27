class UsersController < ApplicationController
    # respond_to :json, :html
    
    def index 
        @users = User.all 
    end 

    def new
        @user = User.new 
    end 
    def create 
        #Research why password isn't showing up
        #in params[:user]
        params[:user][:password] = params[:password]
        # @user = User.new(email: params[:user][:email], username: params[:user][:username], password: params[:password])
        user = User.new(user_params)
        if user.save
            puts user
            login(user)
            options = {}
            @user = UserSerializer.new(user, options)

            respond_as_json(@user)
        else 
            puts "Failed to save"
            flash[:error] = "incorrect email or password"
            redirect_to root_path
        end 
    end

    def show 
        @user = User.find(params[:id])

        respond_as_json(@user)
    end 

    def update
         @user = User.find(params[:id])
         @user.update_attributes(user_params)


        if @user.save
            respond_as_json(@user)
        else
            puts "Failed to update"
            flash[:error] = "incorrect email or password"
            redirect_to root_path
        end

    end 


    private 

    def user_params 
        params.require(:user).permit(:username, :email, :password, :about_me, :wins, :losses, :ties)
    end 
end

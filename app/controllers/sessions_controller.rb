class SessionsController < ApplicationController
   
    def new
    end 


    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user && user.authenticate(params[:session][:password])
            login(user)
            # @user = user.as_json

            options = {}
            @user = UserSerializer.new(user, options)
           
            respond_as_json(@user)

        else 
            flash[:danger] = "invalid email or password!!!!!"
            #redirect

            puts flash[:danger]
        end 
    end 

    def destroy 
        log_out if logged_in? 
        #redirect 
    end 
end

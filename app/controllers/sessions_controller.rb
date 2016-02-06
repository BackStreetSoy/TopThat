class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            login(user)
            #redirect 
        else 
            flash[:danger] = "invalid email or password"
            #redirect
        end 
    end 

    def destroy 
        log_out if logged_in? 
        #redirect 
    end 
end

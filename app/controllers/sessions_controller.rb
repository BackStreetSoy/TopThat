class SessionsController < ApplicationController
    respond_to :json
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }

   
    def new
    end 


    def create
        "hello"
        puts "params: " 
        puts params
        user = User.find_by(email: params[:session][:email].downcase)

        if user && user.authenticate(params[:session][:password])
            login(user)
            
            puts "!!!!!!!!"
            user.to_json
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

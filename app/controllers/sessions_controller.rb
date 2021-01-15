class SessionsController < ApplicationController
    def new
        
    end
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            flash[:notic] = "Welcome back #{user.name}!"
            redirect_to user_path(user)
        else
            flash.now[:alert] = 'Check your login details'
            render :new
        end
    end
    def destroy
        
    end
end
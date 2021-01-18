# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back #{user.name}!"
      redirect_to user_path(user)
    else
      flash.now[:alert] = 'Check your login details'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = 'Logged out!'
    redirect_to root_path
  end
end

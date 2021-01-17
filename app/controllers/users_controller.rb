# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update]
  before_action :delete_privilege, only: [:destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "welcome #{@user.name}"
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
   
  end

  def update
    
    if @user.update(user_params)
      flash[:notice] = " Your user's info has been updated"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def destroy
      @user.destroy
      #session[:user_id] = nil unless current_user.admin?
      if current_user.admin?
        session[:user_id] = nil if current_user == @user 
      else
        session[:user_id] = nil
      end
      flash[:notice] = 'Your account and all articles associated with it were deleted'
      redirect_to articles_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])  
  end
  def require_same_user
    
    unless @user == current_user
      redirect_to root_path  
      flash[:alert] = 'You could only edit your own account'
    end
  end
  def confirmed_password?

    current_user.authenticate(params[:user][:password])
  end

  def delete_privilege
    if current_user.admin? 
      if current_user == @user 
        unless confirmed_password?
          flash.now[:alert] = 'Inncorrect password'
          render 'pages/confirm_password'
        end
      end 
    else
      require_same_user
      unless confirmed_password?
        flash.now[:alert] = 'Inncorrect password'
        render 'pages/confirm_password'
      end
    end
  end

end

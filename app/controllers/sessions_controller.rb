class SessionsController < ApplicationController

layout 'home'

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def omni
    if logged_in?
      flash[:danger] = "You are already logged through an account"
      redirect_to root_url
    else
      hash  = request.env["omniauth.auth"]
      @user = User.find_or_create_from_auth_hash(hash)
      @user.save!
    	session[:user_id] = @user.id
    	redirect_to root_url
    end
  end


end

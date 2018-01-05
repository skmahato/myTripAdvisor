class SessionsController < ApplicationController

layout 'home'

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if user.admin?
        redirect_to admin_hotels_path
      else
        # redirect_back_or user
        redirect_to hotels_path
      end
      # redirect_back_or user
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
      if current_user.admin?
        redirect_to admin_hotels_path
      else
        redirect_to root_url
      end

    else
      hash  = request.env["omniauth.auth"]
      @user = User.find_or_create_from_auth_hash(hash)
      @user.save!
    	session[:user_id] = @user.id
      if @user.email.nil?
        redirect_to edit_user_path(@user.id)
      else
    	   redirect_to root_url
      end
    end
  end


end

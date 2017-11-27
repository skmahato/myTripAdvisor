class UsersController < ApplicationController

  layout 'home'

  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update, :show]
  before_action :admin_user,     only: [:destroy, :index]


  # def index
  #   @users = User.paginate(page: params[:page], :per_page => 15)
  # end

  def show
    @user = User.find(params[:id])
    @images=@user.images
  end

  def new
    if logged_in?
      flash[:danger] = "You are already logged in..."
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to myTripAdvisor"
      redirect_to (user_path(@user))
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_edit_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # def destroy
  #   User.find(params[:id]).destroy
  #   flash[:success] = "User deleted"
  #   redirect_to users_url
  # end



  private

    def user_params
      params.require(:user).permit(:user_name, :email, :password,
                                   :password_confirmation)
    end
    def user_edit_params
      params.require(:user).permit(:user_name, :email)
    end


end

class EmailsController < ApplicationController

  layout 'home'

  before_action :logged_in_user, only: [:new, :create]
  before_action :twitter_logged


  def new
    @hotel = Hotel.find(params[:hotel_id])
    @user = User.find(params[:user_id])
    @email = Email.new(:hotel_id => @hotel.id, :user_id => @user.id)
  end

  def create
    @email = Email.new(email_params)
    @user=@email.user
    @hotel=@email.hotel
    if @email.save
      # if EmailMailer.new_email(@email).deliver_now
      #   flash[:success] = "Mail sent Successfully..."
      #   redirect_to hotel_path(@email.hotel_id)
      # else
      #   flash[:danger] = "Something went wrong..."
      #   redirect_to hotel_path(@email.hotel_id)
      # end
      EmailMailer.new_email(@email).deliver_now
      flash[:success] = "Mail sent Successfully..."
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def email_params
    params.require(:email).permit(:user_id, :hotel_id, :mail)
  end

end

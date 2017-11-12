class EmailsController < ApplicationController

  layout 'home'

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @user = Hotel.find(params[:user_id])
    @email = Email.new(:hotel_id => @hotel.id, :user_id => @user.id)
  end

  def create
    @email = Email.new(email_params)
    if @email.save
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

class Admin::BookingsController < ApplicationController

  layout "home"

  before_action :logged_in_user
  before_action :admin_user

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @user = User.find(params[:user_id])
    @booking=Booking.new(:hotel_id => @hotel.id, :user_id => @user.id)
  end

  def create
    @booking=Booking.new(booking_params)
    @user=@booking.user
    @hotel=@booking.hotel
    if @booking.save
      flash[:success] = "Booked Successfully."
      redirect_to (admin_hotel_path(@booking.hotel_id))
    else
      render('new')
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :hotel_id, :user_id)
  end
end

class BookingsController < ApplicationController

  layout "home"

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @booking=Booking.new(:hotel_id => @hotel.id)
  end

  def create
    @booking=Booking.new(booking_params)
    @hotel=@booking.hotel
    if @booking.save
      flash[:success] = "Booked Successfully."
      redirect_to (hotel_path(@booking.hotel_id))
    else
      render('new')
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :hotel_id)
  end
end

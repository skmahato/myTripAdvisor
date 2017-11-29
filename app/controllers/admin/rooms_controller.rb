class Admin::RoomsController < ApplicationController

  layout "home"

  before_action :logged_in_user
  before_action :admin_user

  def new
    @hotel=Hotel.find(params[:hotel_id])
    @room=Room.new(:hotel_id=>@hotel.id)
  end

  def create
    @room=Room.new(room_params)
    @hotel=@room.hotel
    if @room.save
      flash[:success] = "Room Added Successfully."
      # redirect_to(root_path)
      redirect_to admin_hotel_path(@room.hotel_id)
    else
      render('new')
    end
  end

  private

  def room_params
    params.require(:room).permit(:room_no, :hotel_id, :guest)

  end

end

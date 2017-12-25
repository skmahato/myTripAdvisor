class Admin::RoomsController < ApplicationController

  layout "home"

  before_action :logged_in_user
  before_action :admin_user


  def index
    @hotel=Hotel.find(params[:hotel_id])
    @rooms=@hotel.rooms
  end

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
      #redirect_to admin_hotel_path(@room.hotel_id)
      redirect_to admin_rooms_path(:hotel_id => @room.hotel.id)
    else
      render('new')
    end
  end

  def edit
    @room=Room.find(params[:id])
    @hotel=@room.hotel
  end

  def update
    @room=Room.find(params[:id])
    @hotel=@room.hotel
    if @room.update_attributes(room_params)
      flash[:success] = "Room Details Updated Successfully."
      redirect_to(admin_rooms_path(:hotel_id => @room.hotel.id))
    else
      render('edit')
    end
  end

  def destroy
    @room=Room.find(params[:id])
    Room.find(params[:id]).destroy
    flash[:danger] = "Room deleted Successfully..."
    redirect_to admin_rooms_path(:hotel_id => @room.hotel.id)
  end

  private

  def room_params
    params.require(:room).permit(:room_no, :hotel_id, :guest)

  end

end

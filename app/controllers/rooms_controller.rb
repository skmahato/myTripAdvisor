class RoomsController < ApplicationController

  layout "home"

  # def new
  #   @hotel=Hotel.find(params[:hotel_id])
  #   @room=Room.new(:hotel_id=>@hotel.id)
  # end
  #
  # def create
  #   @room=Room.new(room_params)
  #
  #   if @room.save
  #     flash[:success] = "Room Added Successfully."
  #     redirect_to(root_path)
  #   else
  #     render('new')
  #   end
  # end

  private

  def room_params
    params.require(:room).permit(:room_no, :hotel_id, :guest)

  end

end

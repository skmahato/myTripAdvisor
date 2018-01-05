class BookingsController < ApplicationController

  layout "home"

  before_action :logged_in_user
  before_action :twitter_logged


  def new
    @hotel = Hotel.find(params[:hotel_id])
    @user = User.find(params[:user_id])
    @booking=Booking.new(:hotel_id => @hotel.id, :user_id => @user.id)
  end

  def create
    @booking=Booking.new(booking_params)
    @user=@booking.user
    @hotel=@booking.hotel
    check_in=@booking.check_in
    check_out=@booking.check_out
    no_of_guests=@booking.no_of_guests
    no_of_rooms=@booking.no_of_rooms
    if @booking.no_of_guests.present?
      room=@hotel.rooms.to_a
      if room.blank?
        guests=0
      else
        guests=@hotel.rooms.sum(:guest).to_i
      end
      if guests >= no_of_guests.to_i
          flag=1
        else
          flag=0
      end
    else
      flag=0
    end
    if @booking.no_of_rooms.present? && flag==1
      rooms=@hotel.rooms.size
      if rooms >= no_of_rooms
        flag=1
      else
        flag=0
      end
    else
      flag=0
    end

    if @booking.no_of_rooms.present? && flag==1
      rooms=@hotel.rooms.order(guest: :desc)
      i=0
      count=0
      rooms.each do |room|
        if i>=no_of_rooms then
          break
        else
        count=count+room.guest.to_i
        i=i+1
      end
      end
      if count>=no_of_guests
        flag=1
      else
        flag=0
      end
    else
      flag=0
    end

    if @booking.check_in.present? && flag==1
      if @booking.check_out.present? && flag==1
        stay = (check_out.to_time.to_i - check_in.to_time.to_i)
        if stay>=0
        books=@hotel.bookings.order(check_in: :asc)
        if books.blank?
          flag=1
        else
          last=books.last
          if (last.check_out.to_time.to_i <= check_in.to_time.to_i)
            flag=1
          else
            flag=0
          end
        end
        d=DateTime.now
        d=d.to_time.to_i
        books.each do |book|
          if (book.check_in.to_time.to_i<=check_in.to_time.to_i)
            d=book.check_out.to_time.to_i
          else
            if ((book.check_in.to_time.to_i-d)>=stay)
              if check_in.to_time.to_i>d
                  flag=1
                else
                  flag=0
              end
            else
              flag=0
            end
          end
        end
      else
        flag=0
      end
      else
        flag=0
      end
    else
      flag=0
    end
    if (flag==1)
      @booking.save
      flash[:success] = "Booked Successfully."
      redirect_to (hotel_path(@booking.hotel_id))
    else
      flash.now[:warning] = "The given fields does not match the Available Bookings..."
      render('new')
    end
  end

  def destroy
    @booking=Booking.find(params[:id])
    d=DateTime.now
    d=d.to_time.to_i
    check_in=@booking.check_in.to_time.to_i
    dif = check_in - d
    if dif>=604800
      @booking.destroy
      flash[:success] = "Booking Cancelled..."
      redirect_to user_path(@booking.user_id)
    else
      flash[:danger] = "Booking cannot be cancelled Before 7 days..."
      redirect_to user_path(@booking.user_id)
    end

  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :hotel_id, :user_id, :no_of_guests, :no_of_rooms)
  end
end

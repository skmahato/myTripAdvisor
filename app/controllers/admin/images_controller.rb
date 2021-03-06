class Admin::ImagesController < ApplicationController

  layout 'home'

  before_action :logged_in_user
  before_action :admin_user

  def index
    @images=Image.all
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @images=Image.where(:hotel_id=>params[:hotel_id])
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @user = User.find(params[:user_id])
    @image = Image.new(:hotel_id => @hotel.id, :user_id => @user.id)
  end

  def create
    @image = Image.new(image_params)
    @user=@image.user
    @hotel=@image.hotel
    if @image.save
      flash[:success] = "The photo was added!"
      redirect_to admin_hotels_path
    else
      render 'new'
    end
  end

    def delete
      @image=Image.find(params[:id])
    end

    def destroy
      @image=Image.find(params[:id])
      @hotel=@image.hotel
      if @image.destroy
        flash[:danger] = "Image Successfully Deleted"
        #redirect_to hotel_path(@hotel)
        redirect_to admin_images_path
      end
    end


  private

  def image_params
    params.require(:image).permit(:user_id, :hotel_id, :image)
  end

end

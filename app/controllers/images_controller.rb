class ImagesController < ApplicationController

  layout 'home'

  before_action :logged_in_user, only: [:destroy, :index]
  before_action :admin_user,     only: [:delete, :destroy, :index]

  def index
    @images=Image.all
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @images=Image.where(:hotel_id=>params[:hotel_id])
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @user = Hotel.find(params[:user_id])
    @image = Image.new(:hotel_id => @hotel.id, :user_id => @user.id)
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "The photo was added!"
      redirect_to root_path
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
        redirect_to hotel_path(@hotel)
      end
    end


  private

  def image_params
    params.require(:image).permit(:user_id, :hotel_id, :image)
  end

end

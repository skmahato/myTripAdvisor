class HotelsController < ApplicationController

  layout 'home'

  before_action :logged_in_user, only: [:new, :create, :edit, :update, :delete, :destroy]
  before_action :admin_user,     only: [:new, :create, :edit, :update, :delete, :destroy]

  def index
    @hotels=Hotel.all
  end

  def show
    @hotel=Hotel.find(params[:id])
    @reviews=Review.where(hotel_id: params[:id])
  end

  def new
    @hotel=Hotel.new
  end

  def create
    @hotel=Hotel.new(hotel_params)
    if @hotel.save
      flash[:success] = "Hotel Created Successfully."
      redirect_to(hotels_path)
    else
      render('new')
    end
  end

  def edit
    @hotel=Hotel.find(params[:id])
  end

  def update
    @hotel=Hotel.find(params[:id])
    if @hotel.update_attributes(hotel_params)
      flash[:success] = "Hotel Updated Successfully."
      redirect_to(hotel_path(@hotel))
    else
      render('edit')
    end
  end

  def delete
    @hotel=Hotel.find(params[:id])
  end

  def destroy
    @hotel=Hotel.find(params[:id])
    @hotel.destroy
    flash[:danger] = "Hotel Deleted Successfully."
    redirect_to(hotels_path)
  end

  private

  def hotel_params
    params.require(:hotel).permit(:hotel_name, :location, :price, :email)
  end
end

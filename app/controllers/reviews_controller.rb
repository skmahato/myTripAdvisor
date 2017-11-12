class ReviewsController < ApplicationController

  layout 'home'


  before_action :logged_in_user, only: [:new, :create,:delete, :destroy]
  before_action :admin_user,     only: [:delete, :destroy]

  def index

  end

  def show
    @hotel = Review.find(params[:id]).hotel
    @review=Review.find(params[:id])

    @comments=@review.comments.all
    #@reviews=Review.where(hotel_id: params[:id])
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @review=Review.new(:hotel_id => @hotel.id)
  end

  def create
    @review=Review.new(review_params)

    if @review.save
      flash[:success] = "Review Created Successfully."
      redirect_to(hotel_path(@review.hotel_id))
    else
      render('new')
    end
  end

  def edit
  end

  def update
  end

  def delete
    @review=Review.find(params[:id])
  end

  def destroy
    @review=Review.find(params[:id])
    @review.destroy
    flash[:danger] = "Review Deleted Successfully."
    redirect_to(hotel_path(@review.hotel_id))
  end


  private

  def review_params
    params.require(:review).permit(:review, :hotel_id)
  end

end

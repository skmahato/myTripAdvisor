class ReviewsController < ApplicationController

  layout 'home'


  before_action :logged_in_user, only: [:new, :create,:delete, :destroy]
  before_action :admin_user,     only: [:delete, :destroy, :index]

  # def index
  #   @reviews=Review.paginate(page: params[:page], :per_page => 15).order(created_at: :desc)
  # end

  def show
    @hotel = Review.find(params[:id]).hotel
    @review=Review.find(params[:id])

    @comments=@review.comments.all
    # @reviews=Review.where(hotel_id: params[:id])
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @user=User.find(params[:user_id])
    @review=Review.new(:hotel_id => @hotel.id, :user_id => @user.id)
  end

  def create
    @review=Review.new(review_params)
    @hotel=@review.hotel
    @user=@review.user
    if @review.save
      flash[:success] = "Review Created Successfully."
      redirect_to(hotel_path(@review.hotel_id))
    else
      render('new')
    end
  end

  # def edit
  #   @review=Review.find(params[:id])
  #   if @review.approved_by?
  #     redirect_to reviews_path
  #   end
  # end
  #
  # def update
  #   @review = Review.find(params[:id])
  #   if @review.approved_by?
  #     redirect_to reviews_path
  #   else
  #     if @review.update(review_edit_params)
  #       flash[:success] = "Review Approved Successfully..."
  #       redirect_to reviews_path
  #     else
  #       render 'edit'
  #     end
  #   end
  #
  # end

  # def delete
  #   @review=Review.find(params[:id])
  # end
  #
  # def destroy
  #   @review=Review.find(params[:id])
  #   @review.destroy
  #   flash[:danger] = "Review Deleted Successfully."
  #   redirect_to(hotel_path(@review.hotel_id))
  # end


  private

  def review_params
    params.require(:review).permit(:review, :hotel_id, :rating, :user_id)
  end

  def review_edit_params
    params.require(:review).permit(:approved_by)
  end

end

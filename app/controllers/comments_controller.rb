class CommentsController < ApplicationController

  layout 'home'

  def index
  end

  def show
  end

  def new
    @review = Review.find(params[:review_id])
    @comment=Comment.new(:review_id => @review.id)
  end

  def create
    @comment=Comment.new(comment_params)

    if @comment.save
      flash[:success] = "Comment Posted Successfully."
      redirect_to(review_path(@comment.review_id))
    else
      render('new')
    end
  end

  def edit
  end

  def update
  end

  def delete
    @comment=Comment.find(params[:id])
  end

  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = "Comment Deleted Successfully."
    redirect_to(review_path(@comment.review_id))
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :review_id)
  end

end

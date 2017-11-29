class Admin::CommentsController < ApplicationController

  layout 'home'

  before_action :logged_in_user
  before_action :admin_user

  def index
    @comments=Comment.paginate(page: params[:page], :per_page => 15).order(created_at: :desc)
  end

  def show
  end

  def new
    @review = Review.find(params[:review_id])
    @comment=Comment.new(:review_id => @review.id)
  end

  def create
    @comment=Comment.new(comment_params)
    @review=@comment.review
    if @comment.save
      flash[:success] = "Comment Posted Successfully."
      redirect_to(admin_review_path(@comment.review_id))
    else
      render('new')
    end
  end

  def edit
    @comment=Comment.find(params[:id])
    if @comment.approved_by?
      redirect_to admin_comments_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.approved_by?
      redirect_to admin_comments_path
    else
      if @comment.update(comment_edit_params)
        flash[:success] = "Comment Approved Successfully..."
        redirect_to admin_comments_path
      else
        render 'edit'
      end
    end

  end

  def delete
    @comment=Comment.find(params[:id])
  end

  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = "Comment Deleted Successfully."
    #redirect_to(review_path(@comment.review_id))
    redirect_to admin_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :review_id)
  end

  def comment_edit_params
    params.require(:comment).permit(:approved_by)
  end

end

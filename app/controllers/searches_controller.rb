class SearchesController < ApplicationController

  layout "home"

  def new
    @search=Search.new
  end

  def create
    @search=Search.create!(search_params)
    redirect_to @search
  end

  def show
    @search=Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:name, :location, :min_price, :max_price, :rating, :guest, :check_in, :check_out)
  end
end

class SearchesController < ApplicationController

  layout "home"
  before_action :twitter_logged


  def index
    location=params[:location]
    check_in=params[:check_in]
    check_out=params[:check_out]
    min_price=params[:min_price]
    max_price=params[:max_price]
    @location=location
    @check_in=check_in
    @check_out=check_out

    hotels = Hotel.all
    hotels=hotels.where("location LIKE ?", "%#{location}%") if location.present?
    hotels=hotels.where("price >= ?", min_price) if min_price.present?
    hotels=hotels.where("price <= ?",max_price) if max_price.present?
    @hotels=hotels
    # @check_i=check_in.to_time.to_i
    # @check_o=check_out.to_time.to_i
    # @stay = (check_out.to_time.to_i - check_in.to_time.to_i)
    # d=DateTime.now
    # @d=d.to_time.to_i




    if check_in.present?
      if check_out.present?
        h=Array.new
        stay = (check_out.to_time.to_i - check_in.to_time.to_i)

        hotels.each do |hotel|
          books=hotel.bookings.order(check_in: :asc)
          if books.blank?
            h<<hotel
          else
            last=books.last
            if (last.check_out.to_time.to_i <= check_in.to_time.to_i)
              h<<hotel
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
                      h<<book.hotel
                  end
                end
              end
            end
          end

        h=h.uniq { |x| x.id }
        hotels=h
      end
    else
      hotels
    end
    @hotels=hotels

    rating=params[:rating]
    guest=params[:guest]
    @guest=guest
    if rating.present? || guest.present?
      if rating.present?
        h=Array.new
        hotels.each do |hotel|
          review = hotel.reviews.to_a
        if review.blank?
          avg_rating = 0
        else
          review=hotel.reviews.where(approved_by: true)
          avg_rating = review.average(:rating).to_i
        end
        if avg_rating >= rating.to_i
          h<<hotel
        end
      end
      hotels=h
    else
      hotels
      end
      if guest.present?
        h=Array.new
        hotels.each do |hotel|
          room=hotel.rooms.to_a
          if room.blank?
            guests=0
          else
            guests=hotel.rooms.sum(:guest).to_i
          end
          if guests >= guest.to_i
              h<<hotel
          end
        end
        hotels=h

      else
        hotels

      end
@hotels=hotels
    end

  end


  # def new
  #   @search=Search.new
  # end
  #
  # def create
  #   @search=Search.create!(search_params)
  #   redirect_to @search
  # end
  #
  # def show
  #   @search=Search.find(params[:id])
  # end
  #
  # private
  #
  # def search_params
  #   params.require(:search).permit(:name, :location, :min_price, :max_price, :rating, :guest, :check_in, :check_out)
  # end
end

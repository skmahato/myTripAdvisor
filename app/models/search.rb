class Search < ApplicationRecord



  def hotels
    @hotels ||= find_hotels

  end


  private


    def find_hotels

      hotels = Hotel.all
      hotels=hotels.where('hotel_name LIKE ?', "%#{name}%") if name.present?
      hotels=hotels.where("location LIKE ?", "%#{location}%") if location.present?
      hotels=hotels.where("price >= ?", min_price) if min_price.present?
      hotels=hotels.where("price <= ?",max_price) if max_price.present?
      hotels

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
        if avg_rating >= rating
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
          if guests >= guest
              h<<hotel
          end
        end
        hotels=h

      else
        hotels

      end

      if check_in.present?
        if check_out.present?
          h=Array.new
          stay = (check_out - check_in).to_i
          hotels.each do |hotel|
            books=hotel.bookings.order(check_in: :asc)
            if books.blank?
              h<<hotel

            end
            d=DateTime.now
            d=d.to_i
              books.each do |book|

                if (book.check_in.to_i<=check_in.to_i)
                  d=book.check_out.to_i

                else
                  if ((book.check_in.to_i-d)>=stay)
                    if check_in.to_i>d
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
  end
end

class Search < ApplicationRecord
  def products
    @products ||= find_products

  end

  private

    def find_products
      products = Hotel.all
      products=products.where('hotel_name LIKE ?', "%#{name}%") if name.present?
      products=products.where("location LIKE ?", "%#{location}%") if location.present?
      products=products.where("price >= ?", min_price) if min_price.present?
      products=products.where("price <= ?",max_price) if max_price.present?
      products

      if check_in.present?
        if check_out.present?
          h=Array.new
          stay = (check_out - check_in).to_i
          products.each do |hotel|
            books=hotel.bookings.order(check_in: :asc)
            d=DateTime.now
            d=d.to_i
              books.each do |book|

                if ((book.check_in.to_i-d) >= stay)
                  h<<book.hotel
                  break
                end

                d=book.check_out.to_i
              end
          end
        end
      h
      end
    end
end

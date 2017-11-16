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


    end
end

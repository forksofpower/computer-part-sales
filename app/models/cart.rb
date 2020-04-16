class Cart < ApplicationRecord
    belongs_to :user
    
    has_many :cart_listings
    has_many :listings, through: :cart_listings
    has_many :parts, through: :listings

    has_many :transactions

    def total_price
        self.parts.sum(:price)
    end

    def cheapest_part
        self.parts.minimum(:price)
    end

end

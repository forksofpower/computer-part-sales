class Cart < ApplicationRecord
    belongs_to :user
    
    has_many :cart_parts
    has_many :parts, through: :cart_parts

    has_many :transactions

    def total_price
        self.parts.sum(:price)
    end

    def cheapest_part
        self.parts.minimum(:price)
    end
end

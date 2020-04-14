class Part < ApplicationRecord
    has_many :seller_parts
    has_many :sellers, through: :seller_parts, source: :user

    def seller
        self.sellers.last
    end
end

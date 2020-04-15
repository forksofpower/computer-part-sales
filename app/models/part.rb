class Part < ApplicationRecord
    has_many :seller_parts
    has_many :sellers, through: :seller_parts, source: :user

    has_many :transactions

    def seller
        self.sellers.last
    end
end

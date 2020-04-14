class User < ApplicationRecord
    has_many :carts

    has_many :seller_parts
    has_many :listed_parts, through: :seller_parts, source: :part
end

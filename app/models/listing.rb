class Listing < ApplicationRecord
    belongs_to :user
    belongs_to :part

    has_many :cart_listings
    has_many :carts, through: :cart_listings

    validates :part_id, presence: true
    validates :part_id, uniqueness: { message: 'is already listed' }
end

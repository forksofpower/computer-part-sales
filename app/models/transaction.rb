class Transaction < ApplicationRecord
    belongs_to :cart
    belongs_to :part

    belongs_to :seller, class_name: 'User', foreign_key: :seller_id
    belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
end

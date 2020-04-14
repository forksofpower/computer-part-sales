class Cart < ApplicationRecord
    belongs_to :user
    
    has_many :cart_parts
    has_many :parts, through: :cart_parts
end

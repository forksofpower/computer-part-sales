class SellerPart < ApplicationRecord
    belongs_to :user
    belongs_to :part
end

class Transaction < ApplicationRecord
    belongs_to :cart
    belongs_to :part

    def seller=(user)
        self.seller_id = user.id
    end

    def seller
        User.find(self.seller_id)
    end

    def buyer=(user)
        self.buyer_id = user.id
    end

    def buyer
        User.find(self.buyer_id)
    end
end

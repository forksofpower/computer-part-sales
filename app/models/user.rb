class User < ApplicationRecord
    has_many :carts

    has_many :seller_parts
    has_many :listed_parts, through: :seller_parts, source: :part

    def buy_transactions
        Transaction.where(buyer_id: self.id)
    end

    def sell_transactions
        Transaction.where(seller_id: self.id)
    end

    def all_transactions
        Transaction.where(seller_id: self.id).or(Transaction.where(buyer_id: self.id))
    end

    def all_transaction_ids
        self.all_transactions.map { |transaction| transaction.id }
    end
end
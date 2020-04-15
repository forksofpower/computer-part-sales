class User < ApplicationRecord
    has_many :carts

    has_many :seller_parts
    has_many :listed_parts, through: :seller_parts, source: :part

    has_many :transactions
    has_many :seller_transactions, class_name: 'Transaction', foreign_key: :seller_id
    has_many :buyer_transactions, class_name: 'Transaction', foreign_key: :buyer_id
    
    def transactions
        Transaction.where(seller_id: self.id).or(Transaction.where(buyer_id: self.id))
    end

    def transaction_ids
        self.transactions.map { |transaction| transaction.id }
    end
end
class User < ApplicationRecord
    has_secure_password
    has_many :carts

    has_many :listings
    has_many :listed_parts, through: :listings, source: :part

    has_many :transactions
    has_many :sales, class_name: 'Transaction', foreign_key: :seller_id
    has_many :purchases, class_name: 'Transaction', foreign_key: :buyer_id

    has_many :parts
    
    def transactions
        Transaction.where(seller_id: self.id).or(Transaction.where(buyer_id: self.id))
    end

    def transaction_ids
        self.transactions.map { |transaction| transaction.id }
    end

    def current_cart
        last_cart = Cart.where(complete: false).find_by(user: self)
        last_cart || Cart.create(user: self)
    end

end

# parts = Part.select('*, CASE WHEN (listings.part_id IS NULL) THEN false ELSE true END as for_sale').joins('LEFT JOIN listings ON parts.id = listings.part_id').where('listings.part_id IS NULL')
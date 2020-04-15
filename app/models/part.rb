class Part < ApplicationRecord
    has_many :listings
    has_many :sellers, through: :listings, source: :user
    belongs_to :user
    has_many :transactions


    @@conditions = ["poor", "decent", "average", "good", "new"]

    def seller
        self.sellers.last
    end

    

    def self.conditions
        @@conditions
    end

    
end

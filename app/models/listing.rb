class Listing < ApplicationRecord
    belongs_to :user
    belongs_to :part

    validates :part_id, presence: true
    validates :part_id, uniqueness: { message: 'is already listed' }
end

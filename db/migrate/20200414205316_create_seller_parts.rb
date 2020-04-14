class CreateSellerParts < ActiveRecord::Migration[6.0]
  def change
    create_table :seller_parts do |t|
      t.integer :user_id
      t.integer :part_id

      t.timestamps
    end
  end
end

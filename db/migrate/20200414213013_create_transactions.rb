class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :cart_id
      t.integer :part_id

      t.timestamps
    end
  end
end

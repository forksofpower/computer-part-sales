class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.integer :part_id
      t.float :price
      t.string :condition

      t.timestamps
    end
  end
end

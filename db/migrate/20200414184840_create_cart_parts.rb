class CreateCartParts < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_parts do |t|
      t.integer :cart_id
      t.integer :part_id

      t.timestamps
    end
  end
end

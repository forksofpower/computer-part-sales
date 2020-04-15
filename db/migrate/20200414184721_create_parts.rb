class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :manufacturer
      t.string :description
      t.string :model
      t.string :quality
      t.string :category
      t.float :price
      t.boolean :available

      t.timestamps
    end
  end
end

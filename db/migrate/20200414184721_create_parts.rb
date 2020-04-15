class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :manufacturer
      t.string :description
      t.string :model
      t.string :condition
      t.string :category
      t.string :user_id

      t.timestamps
    end
  end
end

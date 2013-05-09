class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.belongs_to :charity
      t.belongs_to :cart
      t.belongs_to :category
      t.integer :price
      t.text :description
      t.integer :percentage
      t.belongs_to :user
      t.date :purchased_at
      t.date :expires_from_cart_at

      t.timestamps
    end
    add_index :items, :charity_id
    add_index :items, :cart_id
    add_index :items, :category_id
    add_index :items, :user_id
  end
end

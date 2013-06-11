class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.belongs_to :nonprofit
      t.belongs_to :seller
      t.belongs_to :category
      t.integer :price
      t.text :description
      t.integer :percentage
      t.date :purchased_at
      t.date :expires_from_cart_at
      t.timestamps
    end
    add_index :items, :nonprofit_id
    add_index :items, :category_id
    add_index :items, :seller_id
  end
end

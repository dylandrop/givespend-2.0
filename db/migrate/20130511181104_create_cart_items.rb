class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.belongs_to :cart
      t.belongs_to :item

      t.timestamps
    end
    add_index :cart_items, :cart_id
    add_index :cart_items, :item_id
  end
end

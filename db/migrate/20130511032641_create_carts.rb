class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.belongs_to :user
      t.date :purchased_at

      t.timestamps
    end
    add_index :carts, :user_id
  end
end

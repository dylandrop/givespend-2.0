class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description
      t.belongs_to :item

      t.timestamps
    end
    add_index :reviews, :item_id
  end
end

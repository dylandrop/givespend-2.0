class AddForeignKeysToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :user_received_id, :integer
    add_index :reviews, :user_received_id
    add_column :reviews, :user_given_id, :integer
    add_index :reviews, :user_given_id
  end
end

class AddBoughtByIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :bought_by_id, :integer
    add_index :items, :bought_by_id
  end
end

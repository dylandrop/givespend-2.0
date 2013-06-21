class ChangeAuthenticationsToPolymorphic < ActiveRecord::Migration
  def up
    change_table :authentications do |t|
      t.references :authenticatable, :polymorphic => true
    end
  end

  def down
    change_table :authentications do |t|
      t.remove_column :authenticatable_id
      t.remove_column :authenticatable_type
    end
  end
end

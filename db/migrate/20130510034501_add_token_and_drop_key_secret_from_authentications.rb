class AddTokenAndDropKeySecretFromAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications, :token, :string
    remove_column :authentications, :key
    remove_column :authentications, :secret
  end
end

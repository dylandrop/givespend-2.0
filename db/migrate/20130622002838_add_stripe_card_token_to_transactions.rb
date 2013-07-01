class AddStripeCardTokenToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :stripe_card_token, :string
  end
end

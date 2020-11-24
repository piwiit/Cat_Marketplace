class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :reception_email
      t.float :total_price
      t.belongs_to :cart, index: true
      t.timestamps
    end
  end
end
class AddEmailToJoinArtCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :join_art_carts, :quantity, :integer
  end
end

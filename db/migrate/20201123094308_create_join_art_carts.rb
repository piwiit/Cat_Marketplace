class CreateJoinArtCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :join_art_carts do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :artwork, index: true
      t.timestamps
    end
  end
end

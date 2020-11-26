class CreateJoinArtCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :join_art_carts do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :artwork, null: false, foreign_key: true
      t.timestamps
    end
  end
end

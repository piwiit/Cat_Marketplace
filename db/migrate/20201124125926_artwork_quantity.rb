class ArtworkQuantity < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :quantity, :integer 
  end
end

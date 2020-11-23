class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.float :price
      t.string :image
      t.text :description
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end

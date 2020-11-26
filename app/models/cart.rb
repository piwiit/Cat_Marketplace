class Cart < ApplicationRecord
  belongs_to :user
  has_many :join_art_carts
  has_many :artworks, through: :join_art_carts

  def total
    join_art_carts.to_a.sum(&:price_artwork)
  end
end

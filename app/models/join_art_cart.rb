class JoinArtCart < ApplicationRecord
  belongs_to :cart
  belongs_to :artwork
  validates :artwork, presence: true
  validates :cart, presence: true

  def price_artwork
    price = artwork.price
  end
end

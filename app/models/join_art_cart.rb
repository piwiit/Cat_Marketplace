class JoinArtCart < ApplicationRecord
  belongs_to :cart
  belongs_to :artwork
  validates :artwork, presence: true
  validates :cart, presence: true

<<<<<<< HEAD

=======
  def price_artwork
    price = artwork.price
  end
>>>>>>> b8b254f5a54b415d3e0742a4272f64bf2698ea4d
end

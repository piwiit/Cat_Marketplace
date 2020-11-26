class Cart < ApplicationRecord
  belongs_to :user
  has_many :join_art_carts
  has_many :artworks, through: :join_art_carts

<<<<<<< HEAD
#   def total
#     self.to_a.summ(&:total)
# end

=======
  def total
    join_art_carts.to_a.sum(&:price_artwork)
  end
>>>>>>> b8b254f5a54b415d3e0742a4272f64bf2698ea4d
end

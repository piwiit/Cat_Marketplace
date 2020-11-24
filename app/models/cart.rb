class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :order
  has_many :artworks, through: :join_art_carts
end

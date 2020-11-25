class Cart < ApplicationRecord
  belongs_to :user
  has_many :join_art_carts
end

class JoinArtCart < ApplicationRecord
  belongs_to :cart
  belongs_to :artwork
  validates :artwork, presence: true
  validates :cart, presence: true


end

class Category < ApplicationRecord
  has_many :artworks
  validates :name, uniqueness: true, presence: true
end

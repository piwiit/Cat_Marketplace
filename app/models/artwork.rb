class Artwork < ApplicationRecord
  has_one_attached :picture
  belongs_to :category
  has_many :join_art_carts

  validates_presence_of :title, :description, :price
  validates :title, length: { in: 3...64 }
  validates :title, uniqueness: { case_sensitive: false }  
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { in: 10...1500 }
  validates :category, presence: true
end

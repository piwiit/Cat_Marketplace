class User < ApplicationRecord #  :lockable, :timeoutable, :trackable and :omniauthable # Include default devise modules. Others available are:
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  has_many :carts
  validates_presence_of :firstname, :lastname, :age
  validates :age,
            numericality: { only_integer: true, greater_than_or_equal_to: 13 }
validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Entrez une adresse email valide." }
end

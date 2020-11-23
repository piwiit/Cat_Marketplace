class User < ApplicationRecord # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable # Include default devise modules. Others available are:
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  has_many :carts
  validates_presence_of :firstname, :lastname, :age, :description
  validates :age,
            numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :description, length: { in: 10...5000 }
end

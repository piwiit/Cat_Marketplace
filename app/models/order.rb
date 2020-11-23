class Order < ApplicationRecord
  belongs_to :cart

  validates_presence_of :reception_email
end

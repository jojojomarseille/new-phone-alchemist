class Order < ApplicationRecord
  belongs_to :user
  has_many :products

  monetize :amount_cents

end

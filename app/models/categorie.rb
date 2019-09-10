class Categorie < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: {
    message: "La categorie doit avoir un nom."
  }

  validates :name, uniqueness: {
    message: "Ce nom est déjà pris."
  }

 #ces validates servent a mettres des conditions a la creation d'une instance de la classe categorie, par exemple, le name doit etre present et unique
end

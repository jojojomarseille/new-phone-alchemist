class Product < ActiveRecord::Base
  belongs_to :categorie
  belongs_to :zone
  has_many :line_items, dependent: :nullify

  mount_uploader :photo, PhotoUploader #cela definie, je ne sait pas comment qu'il y a un photo uploader pour ce model

   validates :title, presence: {
    message: "Le titre doit être renseigné."
  }

  validates :price, numericality: { greater_than_or_equal_to: 1}

   validates :zone_id, presence: {
    message: "la zone doit être renseigné."
  }

  validates :categorie_id, presence: {
    message: "La categorie doit être renseigné."
  }

  validates :title, uniqueness: {
    message: "Ce titre est déjà pris."
  }

scope :categorie_id, -> (categorie_id) { where categorie_id: categorie_id }

end

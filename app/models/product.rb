class Product < ActiveRecord::Base
  belongs_to :categorie
  belongs_to :zone
  has_many :line_items, dependent: :nullify

  mount_uploader :photo, PhotoUploader #cela definie, je ne sait pas comment qu'il y a un photo uploader pour ce model

   validates :title, presence: {
    message: "Le titre doit être renseigné."
  }
   validates :zone_id, presence: {
    message: "la zone doit être renseigné."
  }

  validates :categorie_id, presence: {
    message: "La categorie doit être renseigné."
  }

  validates :title, uniqueness: {
    message: "Ce titre est déjà pris."
  }


end

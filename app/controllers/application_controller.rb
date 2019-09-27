class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :categories_load

def categories_load
    @lescategories = Categorie.first(3)
    #on charge une variable avec les 3 categorie qui apparaitrons dans la nav barre
    @toutescategories = Categorie.all
    #la on charge une variable pour le menu deroulant de la nav bar, qui affichera toutes les categories.
end

end

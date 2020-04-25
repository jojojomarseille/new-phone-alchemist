class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :categories_load


  before_action :configure_permitted_parameters, if: :devise_controller?





def categories_load
    @lescategories = Categorie.first(5)
    #on charge une variable avec les 3 categorie qui apparaitrons dans la nav barre
    @products = Product.all
    #la on charge tous les produits

end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :firstname, :cp])
  end



end

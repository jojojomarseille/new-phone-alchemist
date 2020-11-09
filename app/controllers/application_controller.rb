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

def audio_code_validation(audio_code)
  @codes = []
    Call.all.each do |appel|
      @codes << appel.code
    end
    return @codes.include?(audio_code)
  end

def audio_code_validation(audio_code)
  # je fais un hash avec tout les appels
  @appels = []
    Call.all.each do |appel|
      @appels << appel
    end

  # je verifie appel par appel si un appel contien le code passé en parametre
   @appels.each do |appel|
    if
      # si un appel a un code egal a celui donné alors je doit dire si il est validé ou pas
      appel.code == audio_code
        if
          appel.code_status = "code validé"
          return "code deja validé, appel id:"+ appel.id
        else
          return "code a valider! appel id:"+ appel.id
        end
    else
      return "ce code ne correspond a aucun appel"
    end
  end
end


protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :firstname, :cp])
  end



end


def audio_code_validation(audio_code)

  @appels = []
    Call.all.each do |appel|
      @appels << appel
    end


   @appels.each do |appel|
    if
      appel.code == audio_code
        if
          appel.code_status = "delivré"
          return "code a valider, appel id: '#{appel.transid}'"
        else
          return "code deja validé"
        end
    else
      return appel.transid
    end
  end
end


loop do |appel|

end

module ApplicationHelper

 def audio_code_validation(audio_code)
  @codes = []
    Call.all.each do |appel|
      @codes << appel.code
    end
    if @codes.include?(audio_code)
      return "votre code a été validé2"
      #ecrire le code qui change le code_status du call ici
    else
      return "code invalide2"
    end
  end

end

class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :CGU, :Qui_sommes_nous]


  def home
  end

  def audiotel
    # quelques elements mis ici a des fin de tests

  @code = 556

  @codes = []
  Call.all.each do |appel|
      @codes << appel.code
  end

  gon.codes = @codes
  gon.user_id = current_user.id
  end

  def audio_code_validation(audio_code)
    @codes = Call.all.code
    puts @codes.include?(audio_code)
  end



  def zoneadmin
    @users = User.all
    @orders = Order.all
  end

  def CGU
  end

  def Qui_sommes_nous
  end

  def user
   @users = User.all
  end

  def Userdashboard
    @orders = Order.where(user_id: current_user.id)
  end
end

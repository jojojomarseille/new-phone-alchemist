class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :CGU, :Qui_sommes_nous]


  def home
  end

  def audiotel

  @codes = []
  Call.all.each do |appel|
    if appel.code_status == "code validé"

    else
      @codes << appel.code
    end
  end

  gon.codes = @codes
  gon.user_id = current_user.id
  end

  # def audio_code_validation(audio_code)
  #   @codes = Call.all.code
  #   puts @codes.include?(audio_code)
  # end



  def zoneadmin
    @users = User.all
    @orders = Order.all
  end

  def CGU
  end

  def Qui_sommes_nous
  end

  def user
   @users = User.page(params[:page]).per(50)
  end

  def Userdashboard
    @orders = Order.where(user_id: current_user.id).page(params[:page]).per(50)
    @codes_promos_user = Code.where(user_id: current_user.id).page(params[:page]).per(50)
  end
end

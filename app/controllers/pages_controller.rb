class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :CGU, :Qui_sommes_nous]


  def home
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
end

class ZonesController < ApplicationController
  def index
    @zones = Zone.page(params[:page]).per(12)
  end

  def new

  end

  def create
    Zone.create name: params[:name], description: params[:description]
    redirect_to "/zones"
  end

  def show
    @zone = Zone.find(params[:id])
  end

  def update
    Zone.find(params[:id]).update name: params[:name], description: params[:description]
    redirect_to "/zones"
  end

  def destroy
    Zone.find(params[:id]).destroy
    redirect_to "/zones"
  end
end

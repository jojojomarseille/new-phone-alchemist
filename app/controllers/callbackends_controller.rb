class CallbackendsController < ApplicationController

def index
  @callbackends = Callbackend.page(params[:page]).per(8)
end

def new
  @callbackend = Callbackend.new
end

def create
  callbackend = Callbackend.create(callbackend_params)
  redirect_to "/callbackends"
end


def callbackend_params
  params.require(:callbackend).permit( :transid, :formule, :starttime, :numero, :endtime, :duree)
end



end

class CallbackstartsController < ApplicationController

def index
  @callbackstarts = Callbackstart.page(params[:page]).per(50)
end

def new
  @callbackstart = Callbackstart.new
end

def create
  callbackstart = Callbackstart.create(callbackstart_params)
  redirect_to "/callbackstarts"
end


def callbackstart_params
  params.require(:callbackstart).permit( :transid, :formule, :starttime, :numero, :code, :callernum)
end



end


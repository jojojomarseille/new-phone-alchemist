class CallsController < ApplicationController

def index
  @calls = Call.page(params[:page]).per(50)
end

def new
  @call = Call.new
end

def create
  call = Call.create(call_params)
  redirect_to "/calls"
end


def call_params
  params.require(:call).permit( :transid, :formule, :starttime, :numero, :code, :callernum, :endtime, :duree, :call_status, :code_status)
end


end

class CodesController < ApplicationController

def index
    @codes = Code.page(params[:page]).per(50)
  end

  def new
  @code = Code.new
end

def create
  code = Code.new(code_params)
  code.user_id = current_user.id
  code.save
  redirect_to "/codes"
end


def code_params
  params.require(:code).permit( :user, :code, :value, :finaluser, :associateduser, :status, :valid_until, :utilised_at)
end

end

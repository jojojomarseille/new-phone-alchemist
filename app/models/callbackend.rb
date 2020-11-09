class Callbackend < ApplicationRecord
after_create :update_call


def update_call
  @current_call = Call.where(transid: self.transid)
 @current_call.update( duree: self.duree, endtime: self.endtime, call_status: "terminé", code_status: "delivré" )
end

end


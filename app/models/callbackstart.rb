class Callbackstart < ApplicationRecord

after_create :create_call


def create_call
 Call.create(transid: self.transid, numero: self.numero, formule: self.formule, starttime: self.starttime, code: self.code, callernum: self.callernum, call_status: "en cours", code_status: "en attente" )
end

end

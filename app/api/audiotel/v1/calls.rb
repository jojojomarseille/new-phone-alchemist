module Audiotel
  module V1
    class Calls < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :calls do

        desc 'Return a specific call'
          route_param :code do
          get do
            call = Call.find_by_code(params[:code])
            present call
          end
          end

        desc 'Update a call.'
            params do

                #requires :transid, type: String, desc: 'transid'
                # requires :formule, type: String, desc: 'Formule'
                # requires :starttime, type: DateTime, desc: 'Starttime'
                # requires :numero, type: String, desc: ' Numero'
                requires :code, type: String, desc: 'Code'
                # requires :callernum, type: String, desc: 'Caller num'

            end

            post do
            @call = Call.find_by_code(params[:code])
             @call.update(code_status: "code validé")
            end
      end
    end
  end
end

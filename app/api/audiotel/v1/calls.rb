module Audiotel
  module V1
    class Calls < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :calls do



        # desc 'Return list of calls'
        #   get do
        #     calls = Call.all
        #     present calls
        #   end
        # end

      # desc 'Return a specific callbackstart'
      #   route_param :id do
      #   get do
      #     callbackstart = Callbackstart.find(params[:id])
      #     present callbackstart
      #   end
      # end

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

module Audiotel
  module V1
    class Codes < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :codes do

        desc 'Return list of codes'
          get do
            userCodes = Code.find_by_user_id
            present callbackstarts
          end


        desc 'Return a specific code'
          route_param :code do
          get do
            codeToUse = Code.find_by_code(params[:code])
            present codeToUse
          end
          end



        desc 'Create a code.'
              params do
                requires :code, type: Hash do
                  requires :user_id, type: Integer, desc: 'user_id'
                  requires :transid, type: String, desc: 'transid'
                  requires :code, type: String, desc: 'code'
                  requires :value, type: Float, desc: 'value'
                  requires :finaluser, type: String, desc: 'Utilisateur final'
                  requires :associatedorder, type: String, desc: 'Commande associée'
                  requires :status, type: String, desc: 'Status'
                  requires :valid_until, type: DateTime, desc: 'date limitte de validitée'
                  requires :utilised_at, type: DateTime, desc: 'Date d utilisation'
                end
              end

              post do
               @code_promo = Code.create(params[:code])
              end

        resource :using do
        desc 'Update a code status and order'
            params do

                #requires :transid, type: String, desc: 'transid'
                # requires :formule, type: String, desc: 'Formule'
                # requires :starttime, type: DateTime, desc: 'Starttime'

                requires :code, type: String, desc: 'Code'
                requires :associatedorder, type: String, desc: 'order associated'
                # requires :callernum, type: String, desc: 'Caller num'

          end

          post do
            @code = Code.find_by_code(params[:code])
             @code.update(status: "code utilisé", associatedorder: params[:associatedorder])
            end
        end
      end

        # resource :used do
        # desc 'Update codes status and orders.'
        #     params do
        #         requires :lot, type: Array, desc 'lot a updater'
        #     end


        #     post do
        #       @lot = :lot
        #       @lot.each do |code|

        #      @code = Code.find_by_code(code.code)
        #      @code.update(status: "code utilisé", associatedorder: code.associatedorder)
        #     end
        #     end






  end
end
end

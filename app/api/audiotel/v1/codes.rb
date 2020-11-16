module Audiotel
  module V1
    class Codes < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :codes do

      #   desc 'Return list of callbackstarts'
      #   get do
      #     callbackstarts = Callbackstart.all
      #     present callbackstarts
      #   end
      # end

      # desc 'Return a specific callbackstart'
      #   route_param :code do
      #   get do
      #     callbackstart = Callbackstart.find_by_code(params[:code])
      #     present callbackstart
      #   end
      # end

      desc 'Create a code.'
            params do
              requires :code, type: Hash do
                requires :user_id, type: Integer, desc: 'user_id'
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
        end
    end
  end
end


module Audiotel
  module V1
    class Callbackends < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :callbackends do


      desc 'Create a callbackend.'
            params do
              requires :callbackend, type: Hash do
                requires :transid, type: String, desc: 'transid.'
                requires :formule, type: String, desc: 'Formule'
                requires :starttime, type: DateTime, desc: 'Starttime'
                requires :numero, type: String, desc: ' Numero'
                requires :endtime, type: DateTime, desc: 'Starttime'
                requires :duree, type: String, desc: 'Code'

              end
            end

            post do
             @callbackend = Callbackend.create(params[:callbackend])
            end
      end

    end
  end
end

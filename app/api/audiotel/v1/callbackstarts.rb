module Audiotel
  module V1
    class Callbackstarts < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :callbackstarts do

        desc 'Return list of callbackstarts'
        get do
          callbackstarts = Callbackstart.all
          present callbackstarts
        end


        desc 'Return a specific callbackstart'
          route_param :code do
          get do
            callbackstart = Callbackstart.find_by_code(params[:code])
            present callbackstart
          end
        end

        desc 'Create a callbackstart.'
              params do
                requires :callbackstart, type: Hash do
                  requires :transid, type: String, desc: 'transid.'
                  requires :formule, type: String, desc: 'Formule'
                  requires :starttime, type: DateTime, desc: 'Starttime'
                  requires :numero, type: String, desc: ' Numero'
                  requires :code, type: String, desc: 'Code'
                  requires :callernum, type: String, desc: 'Caller num'
                end
              end

            post do
             @callbackstart = Callbackstart.create(params[:callbackstart])
            end
      end
    end
  end
end

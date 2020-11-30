module Audiotel
  module V1
    class Orders < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :orders do

        desc 'retourne une order'
        route_param :id do
          get do
            ordercurrentlyupdated = Order.find_by_id(params[:id])
            present ordercurrentlyupdated
          end
          end




        desc 'Update a order.'
            params do
                #requires :transid, type: String, desc: 'transid'
                # requires :formule, type: String, desc: 'Formule'
                # requires :starttime, type: DateTime, desc: 'Starttime'
              # route_param :code do
                requires :code, type: String, desc: 'Code'
                requires :order ,type: String, desc: 'oder'

                # requires :callernum, type: String, desc: 'Caller num'
            end

            #je retrouve le code a partir du code et je le charge dans une variable
            #je dois avec le code, retrouver le montant du code
            #je dois retrouver l'order associée au code fournis
            #je dois diminuer le montant de l'order associée dumontant du code promo
            post do
            @code = Code.find_by_code(params[:code])
            @ordertoupdate = Order.find_by_id(params[:order])
            new_amount = @ordertoupdate.amount_cents - @code.value*100
            @ordertoupdate.update(amount_cents: new_amount)
            # present @ordertoupdate

             #@code.update(status: "code utilisé", associatedorder: params[:associatedorder])
            end


      end
    end
  end
end

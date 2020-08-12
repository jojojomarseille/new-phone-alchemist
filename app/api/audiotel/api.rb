# module Audiotel
#   class API < Grape::API
#     version 'v1', using: :header, vendor: 'audiotel'
#     format :json
#     prefix :api


#     resource :statuses do


#       desc 'Create a callbackstart.'
#       params do
#         requires :status, type: String, desc: 'Your status.'
#       end
#       post do
#         authenticate!
#         Status.create!({
#           user: current_user,
#           text: params[:status]
#         })
#       end

#       desc 'Create a callbackend.'
#       params do
#         requires :status, type: String, desc: 'Your status.'
#       end
#       post do
#         authenticate!
#         Status.create!({
#           user: current_user,
#           text: params[:status]
#         })
#       end



#     end
#   end
# end


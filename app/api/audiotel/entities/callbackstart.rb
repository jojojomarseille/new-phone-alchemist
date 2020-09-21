module Audiotel
 module Entities
  class Callbackstart < Grape::Entity
   expose :formule
   expose :starttime
   expose :numero
  end
 end
end

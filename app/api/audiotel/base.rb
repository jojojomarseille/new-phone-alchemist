module Audiotel
  class Base < Grape::API
    mount Audiotel::V1::Callbackstarts
    mount Audiotel::V1::Callbackends
  end

end


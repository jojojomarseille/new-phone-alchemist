module Audiotel
  class Base < Grape::API
    mount Audiotel::V1::Callbackstarts
    mount Audiotel::V1::Callbackends
    mount Audiotel::V1::Calls
    mount Audiotel::V1::Codes
    mount Audiotel::V1::Orders
  end

end


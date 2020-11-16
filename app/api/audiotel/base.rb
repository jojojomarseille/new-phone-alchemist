module Audiotel
  class Base < Grape::API
    mount Audiotel::V1::Callbackstarts
    mount Audiotel::V1::Callbackends
    mount Audiotel::V1::Calls
    mount Audiotel::V1::Codes
  end

end


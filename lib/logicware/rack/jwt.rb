module Logicware
  module Rack
    # JSON Web Token
    module JWT
      autoload :Auth, 'logicware/rack/jwt/auth'
      autoload :Token, 'logicware/rack/jwt/token'
    end
  end
end

require "logicware/version"

module Logicware
  class Error < StandardError; end

  autoload :JWT, 'logicware/rack/jwt'
end

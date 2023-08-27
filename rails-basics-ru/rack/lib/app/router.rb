# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    request = Rack::Request.new(env)
    if request.path == '/' || request.path == '/about'
      [200, {}, ["success"]]
    else
      [404, {}, ["404 Not Found"]]
    end
    # END
  end
end

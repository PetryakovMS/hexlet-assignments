# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    request = Rack::Request.new(env)
    if request.path == '/'
      sha = Digest::SHA2.hexdigest 'Hello, World!'
      [200, {}, ['Hello, World!', sha]]
    elsif request.path == '/about'
      sha = Digest::SHA2.hexdigest 'About page'
      [200, {}, ['About page', sha]]
    else
      [404, {}, ["404 Not Found"]]
    end
    # END
  end
end

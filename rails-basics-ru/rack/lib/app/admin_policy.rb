# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    request = Rack::Request.new(env)
    if request.path.include?('admin')
      [403, {}, ["forbidden"]]
    else
      @app.call(env)
    end
    # END
  end
end

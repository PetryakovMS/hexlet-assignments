# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    @status, @headers, @response = @app.call(env)
    locale = env["HTTP_ACCEPT_LANGUAGE"]&.scan(/^[a-z]{2}/)&.first

    I18n.locale = if locale.present?
                    locale
                  else
                    'en'
                  end



    @app.call(env)
  end
  # END
end

# params[:locale] || I18n.default_locale
# I18n.with_locale(locale, &action)


# def switch_locale(&action)
#   logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
#   locale = extract_locale_from_accept_language_header
#   logger.debug "* Locale set to '#{locale}'"
#   I18n.with_locale(locale, &action)
# end
#
# private
# def extract_locale_from_accept_language_header
#   request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
# end
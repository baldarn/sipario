class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  around_action :switch_locale

  respond_to :html, :json

  protect_from_forgery unless: -> { request.format.json? }

  def switch_locale(&action)
    locale = extract_locale_from_accept_language_header
    locale = I18n.default_locale unless ACCEPTED_LANGUAGES.include?(locale)

    I18n.with_locale(locale, &action)
  end

  private
    ACCEPTED_LANGUAGES = [ "it", "en" ]

    def extract_locale_from_accept_language_header
      request.env["HTTP_ACCEPT_LANGUAGE"].scan(/^[a-z]{2}/).first
    end
end

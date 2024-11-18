class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  respond_to :html, :json

  protect_from_forgery unless: -> { request.format.json? }
end

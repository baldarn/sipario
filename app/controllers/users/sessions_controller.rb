# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    skip_forgery_protection

    private

    def respond_with(_resource, _opts = {})
      respond_to do |format|
        format.html { super }
        format.json { render json: { message: "Logged." }, status: :ok }
      end
    end

    def respond_to_on_destroy
      current_user ? log_out_success : log_out_failure
    end

    def log_out_success
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { render json: { message: "Logged out." }, status: :ok }
      end
    end

    def log_out_failure
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { render json: { message: "Logged out failure." }, status: :unauthorized }
      end
    end
  end
end

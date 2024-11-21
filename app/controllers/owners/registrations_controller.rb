# frozen_string_literal: true

module Owners
  class RegistrationsController < Devise::RegistrationsController
    before_action :set_provider, only: %i[edit destroy]

    def set_provider
      @provider = current_owner.provider
    end

    # POST /resource
    def create
      build_resource(sign_up_params)

      params[:owner][:registering] = true
      super

      return turbo_stream if @user.errors.present?

      @provider = Provider.create!(
        name: @user.club_name,
        email: @user.club_email,
        address: @user.club_address,
        postal_code: @user.club_postal_code,
        municipality: @user.club_municipality,
        province: @user.club_province,
        tax_code: @user.club_tax_code,
        telephone: @user.club_telephone
      )
      @user.club = @club
      @user.save
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(
        :sign_up,
        keys: %i[first_name last_name registering club_name club_email club_address club_postal_code club_municipality
                  club_province club_tax_code club_telephone _rucaptcha]
      )
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
    end
  end
end

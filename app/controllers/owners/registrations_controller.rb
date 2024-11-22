# frozen_string_literal: true

module Owners
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [ :create ]
    before_action :configure_account_update_params, only: [ :update ]

    before_action :set_provider, only: %i[edit destroy update]


    def set_provider
      @provider = current_owner.provider
    end

    # POST /resource
    def create
      build_resource(sign_up_params)

      params[:owner][:registering] = true
      super

      return turbo_stream if @owner.errors.present?

      @provider = Provider.create!(
        name: @owner.provider_name,
        lonlat: @owner.provider_lonlat,
        minutes_for_points: @owner.provider_minutes_for_points
      )
      @owner.provider = @provider
      @owner.save
    end

    def edit
      provider = @owner.provider

      @owner.provider_name = provider.name
      @owner.provider_lonlat = provider.lonlat
      @owner.provider_minutes_for_points = provider.minutes_for_points

      super
    end

    def update
      params[:owner][:registering] = true
      super

      return turbo_stream if @owner.errors.present?

      @owner.provider.update(
        name: @owner.provider_name,
        lonlat: @owner.provider_lonlat,
        minutes_for_points: @owner.provider_minutes_for_points
      )
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(
        :sign_up,
        keys: %i[provider_name provider_minutes_for_points provider_lonlat registering]
      )
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(
        :account_update,
        keys: %i[provider_name provider_minutes_for_points provider_lonlat registering]
      )
    end
  end
end

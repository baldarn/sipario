# frozen_string_literal: true

module Owners
  class RegistrationsController < Devise::RegistrationsController
    before_action :set_provider, only: %i[edit destroy]

    def set_provider
      @provider = current_owner.provider
    end
  end
end

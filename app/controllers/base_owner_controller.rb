# frozen_string_literal: true

class BaseOwnerController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_provider

  def set_provider
    @provider = current_owner.provider
  end
end

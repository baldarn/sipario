# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_provider

  def set_provider
    @provider = current_owner&.provider
  end

  def index
  end
end

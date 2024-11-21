# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_provider

  def set_provider
    @provider = current_owner&.provider
  end

  def index
  end

  def download_android
    send_file("#{Rails.root}/mobile_apps/sipario.apk")
  end

  def download_apple
    send_file("#{Rails.root}/mobile_apps/sipario.app")
  end
end

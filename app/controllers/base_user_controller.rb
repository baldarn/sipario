# frozen_string_literal: true

class BaseUserController < ApplicationController
  before_action :authenticate_user!
end

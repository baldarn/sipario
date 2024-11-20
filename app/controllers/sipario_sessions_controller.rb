class SiparioSessionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @sipario_session = SiparioSession.build(sipario_session_params.merge(user: current_user))

    if @sipario_session.save
      head :ok
    else
      render json: @sipario_session.errors, status: :unprocessable_entity
    end
  end

  private

  def sipario_session_params
    params.require(:sipario_session).permit(:device_identifier, :nearby_identifiers)
  end
end

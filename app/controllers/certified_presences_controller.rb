class CertifiedPresencesController < ApplicationController
  before_action :authenticate_owner!

  def create
    @certified_presence = CertifiedPresence.build(certified_presence_params.merge(owner: current_owner))

    if @certified_presence.save
      head :ok
    else
      render json: @certified_presence.errors, status: :unprocessable_entity
    end
  end

  private

  def certified_presence_params
    params.require(:certified_presence).permit(:device_identifier)
  end
end

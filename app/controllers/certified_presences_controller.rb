class CertifiedPresencesController < ApplicationController
  before_action :authenticate_owner!

  def create
    device_identifier = certified_presence_params[:device_identifier]
    @certified_presence = current_owner.certified_presences.where(device_identifier: device_identifier).first

    if @certified_presence
      @certified_presence.touch
      return head :ok
    end

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

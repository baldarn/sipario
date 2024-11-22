# frozen_string_literal: true

class AwardsController < BaseOwnerController
  skip_before_action :authenticate_owner!, only: [ :redeem ]
  skip_before_action :set_provider, only: [ :redeem ]

  before_action :authenticate_user!, only: [ :redeem ]

  def index
    @awards = @provider.awards.page(params[:page])
  end

  def new
    @award = @provider.awards.new
  end

  def show
    @award = @provider.awards.find(params[:id])
  end

  def edit
    @award = @provider.awards.find(params[:id])
  end

  def create
    @award = @provider.awards.build(award_params)

    if @award.save
      redirect_to provider_awards_url(@provider), flash: { notice: I18n.t("awards.created") }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @award = @provider.awards.find(params[:id])

    if @award.update(award_params)
      redirect_to provider_awards_url(@provider), flash: { notice: I18n.t("awards.updated") }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @award = @provider.awards.find(params[:id])
    @award.destroy

    redirect_to provider_awards_url(@provider), flash: { success: I18n.t("awards.destroyed") }
  end

  def consume
    @point_event = @provider.point_events.where(consume_code: params[:award_consume_code]).first

    if @point_event.present? && !@point_event.used
      @point_event.update(used: true)

      head :ok
    else
      head :unprocessable_entity
    end
  end

  def redeem
    award = Award.find(params[:award_id])

    if current_user.points_for_provider(award.provider) < award.points_to_redeem
      return redirect_to provider_url(award.provider), flash: { notice: I18n.t("awards.too_few_points") }
    end

    current_user.redeem_award(award)

    redirect_to point_events_url, flash: { success: I18n.t("awards.redeemed") }
  end

  private

  def award_params
    params.require(:award).permit(:name, :description, :points_to_redeem)
  end
end

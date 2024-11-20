class PointEventsController < BaseUserController
  def index
    @point_events = current_user.point_events.order(created_at: :desc).page(params[:page])
  end
end

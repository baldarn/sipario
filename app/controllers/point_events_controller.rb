class PointEventsController < BaseUserController
  def index
    @point_events = current_user.point_events.order(created_at: :desc).page(params[:page])
  end

  def consume_code
    @point_event = current_user.point_events.find(params[:point_event_id])
  end
end

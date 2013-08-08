class EventsController < ApplicationController
  def index
    @events = Event.order('start_time ASC')
    @ordered_events_by_day = @events.group_by(&:day)
    @days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to events_path, notice: "Event added"
    else
      render action: :new, alert: "Event not added"
    end
  end

  private

  def event_params
    params.require(:event).permit(:day, :start_time, :end_time, :description)
  end

end

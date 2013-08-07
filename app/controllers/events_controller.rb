class EventsController < ApplicationController
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

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:day, :start, :end, :description)
  end

end

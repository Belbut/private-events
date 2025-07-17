class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    current_user.events_created.build(params(:event))
  end

  protected

  def event_params
    params.expect(event: %i[name date location])
  end
end

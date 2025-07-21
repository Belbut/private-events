class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events_created.new(event_params)
    if @event.save
      redirect_to events_path, notice: "You created #{event_params[:name]} event!"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @host = @event.creator
    @attendees = @event.attendees
  end

  protected

  def event_params
    params.expect(event: %i[name date location])
  end
end

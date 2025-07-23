class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_event, only: %i[show destroy edit update]

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
    @host = @event.creator
    @attendees = @event.attendees
  end

  def destroy
    @event.destroy

    redirect_to events_path, notice: 'You deleted the event!'
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  protected

  def event_params
    params.expect(event: %i[name date location])
  end

  def find_event
    @event = Event.find(params[:id])
  end
end

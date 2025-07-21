class InvitationsController < ApplicationController
  def create
    event = Event.find(params[:event])
    @inv = Invitation.new(event: event, attendee: current_user)
    if @inv.save
      redirect_to(event_path(params[:event]))
    else
      render 'event/index', status: :unprocessable_entity
    end
  end

  def destroy
    puts '*******************************************************'
    @inv = Invitation.find_by(event: params[:id], attendee: current_user)
    @inv.destroy
  end
end

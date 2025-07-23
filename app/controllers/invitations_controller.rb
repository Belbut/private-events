class InvitationsController < ApplicationController
  def create
    event = Event.find(params[:event])
    @inv = Invitation.create(event: event, attendee: current_user)

    redirect_to(event_path(params[:event]))
  end

  def destroy
    @inv = Invitation.find_by(event: params[:id], attendee: current_user)
    return if @inv.nil?

    @inv.destroy
    redirect_to request.original_url, notice: 'Invitation declined!'
  end
end

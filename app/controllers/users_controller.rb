class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @invited_events = @user.events_invited
  end

  def index
    @users = User.all
  end
end

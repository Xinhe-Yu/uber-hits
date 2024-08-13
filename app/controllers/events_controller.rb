class EventsController < ApplicationController
  def new
    @fighter = Fighter.find(params[:fighter_id])
    @event = Event.new
  end

  def create
    @fighter = Fighter.find(params[:fighter_id])
    @event = Event.new(event_params)
    @event.user = current_user
    @event.fighter = @fighter
    @event.status = "pending"
    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :place, :start_time, :end_time, :target, :fight_type)
  end
end

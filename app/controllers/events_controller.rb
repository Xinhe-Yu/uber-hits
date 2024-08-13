class EventsController < ApplicationController
  before_action :set_event, only: %i[edit update destroy]

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

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to dashboard_path
    else
      p @event.errors
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @event.destroy
      redirect_to dashboard_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :place, :start_time, :end_time, :target, :fight_type)
  end
end

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    # waiting for is_private colomn for events' table
    @events = Event.where(is_private: false).where(status: "accepted")
  end

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
      redirect_to event_path(@event), notice: "You just created an event with #{@fighter.nickname}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @review = Review.new
    @waiting_for_comment = waiting_for_comment
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: "You succesfully modified the event."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @event.destroy
      redirect_to dashboard_path, notice: "You deleted the event."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :title, :description, :place,
      :start_time, :end_time,
      :target, :fight_type,
      :is_private,
      :photo, :status
    )
  end

  def waiting_for_comment
    return false if @event.end_time.to_datetime < Time.now

    is_user = @event.user == current_user
    is_fighter = @event.fighter == current_user.fighter
    return false if !(is_user || is_fighter) || @event.reviews.length == 2
    return true if @event.reviews.empty?

    @event.reviews[0].user_to_fighter != user
  end
end

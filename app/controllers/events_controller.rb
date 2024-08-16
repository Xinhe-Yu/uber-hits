class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :set_fighter, only: %i[new create]
  skip_before_action :authenticate_user!, only: :index

  def index
    # waiting for is_private colomn for events' table
    @events = Event.where(is_private: false).where(status: "accepted")
    @events = [@events.where('end_time > ?', Time.current).where('start_time < ?', Time.current),
               @events.where('start_time > ?', Time.current),
               @events.where('end_time < ?', Time.current)]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.fighter = @fighter
    @event.status = "pending"
    @event.end_time = calcul_end_time
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
    @event.end_time = calcul_end_time if event_params[:duration].present?
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

  def set_fighter
    @fighter = Fighter.find(params[:fighter_id])
  end

  def event_params
    params.require(:event).permit(
      :title, :description, :place,
      :start_time, :duration,
      :target, :fight_type,
      :is_private,
      :photo, :status
    )
  end

  def waiting_for_comment
    return false if @event.end_time.to_datetime > Time.now

    is_user = @event.user == current_user
    is_fighter = @event.fighter == current_user.fighter
    return false if !(is_user || is_fighter) || @event.reviews.length == 2
    return true if @event.reviews.empty?

    @event.reviews[0].user_to_fighter != is_user
  end

  def calcul_end_time
    duration = event_params[:duration].empty? ? 1 : event_params[:duration].to_i
    p "start time type"
    p event_params[:start_time]
    Time.zone.parse(event_params[:start_time]) + duration.hours
  end
end

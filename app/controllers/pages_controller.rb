class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @fighters = Fighter.all
    @duration = 1
    @markers = @fighters.geocoded.map do |fighter|
      {
        lat: fighter.latitude,
        lng: fighter.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { fighter: fighter })
      }
    end
  end

  def dashboard
    @events = Event.where(user_id: current_user.id)
    if current_user.fighter
      fighter_events = Event.where(fighter_id: current_user.fighter.id)
      @fighter_events = fighter_events.empty? ? nil : [pending_events(fighter_events), accepted_events(fighter_events)]
    else
      @fighter_events = nil
    end
  end

  def planning
    @days_of_week = %w[monday tuesday wednesday thursday friday saturday sunday]
    today = Date.today
    @real_days = (0..13).to_a.map do |i|
      today + i
    end
    @availability = current_user.fighter.fighter_weekly_availability
    @availabilities = current_user.fighter.fighters_availabilities
    @reservations = current_user.fighter.events.where(status: "accepted")
  end

  private

  def pending_events(fighter_events)
    pending_events = fighter_events.where(status: "pending")
    pending_events.empty? ? nil : pending_events
  end

  def accepted_events(fighter_events)
    accepted_events = fighter_events.where(status: "accepted")
    accepted_events.empty? ? nil : accepted_events
  end
end

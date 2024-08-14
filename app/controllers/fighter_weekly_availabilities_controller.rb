class FighterWeeklyAvailabilitiesController < ApplicationController
  before_action :set_fighter_weekly_availability, only: %i[update]

  def update
    if @fighter_weekly_availability.update(fighter_weekly_availability_params)
      redirect_to planning_path, notice: "Time planning updated."
    else
      redirect_to planning_path, alert: "Time planning could not be updated."
    end
  end

  private

  def set_fighter_weekly_availability
    @fighter_weekly_availability = current_user.fighter.fighter_weekly_availability
  end

  def fighter_weekly_availability_params
    params.require(:fighter_weekly_availability).permit(
      :monday,
      :tuesday,
      :wednesday,
      :thursday,
      :friday,
      :saturday,
      :sunday
    )
  end
end

class FightersAvailabilitiesController < ApplicationController
  before_action :set_fighters_availability, only: %i[update]

  def update
    if @fighters_availability.update(fighters_availability_params)
      redirect_to planning_path, notice: "You changed your timetable for #{@fighters_availability.start_time.to_date} :)"
    else
      redirect_to planning_path, alert: "The planning of for #{@fighters_availability.start_time.to_date} cannot be correctly updated."
    end
  end

  private

  def set_fighters_availability
    @fighters_availability = FightersAvailability.find(params[:id])
  end

  def fighters_availability_params
    params.require(:fighters_availability).permit(:is_available)
  end
end

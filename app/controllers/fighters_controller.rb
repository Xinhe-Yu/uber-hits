class FightersController < ApplicationController
  before_action :set_fighter_by_user_id, only: %i[edit destroy]
  before_action :set_fighter, only: %i[show update]

  def index
    @fighters = Fighter.all
    @duration = params[:duration].present? && !params[:duration].empty? ? params[:duration].to_i : 1
    @fighters = @fighters.search_by_all_names(params[:name]) if params[:name].present? && !params[:name].empty?
    return unless params[:date].present?

    @fighters = @fighters
                .joins(:fighters_availabilities)
                .where(fighters_availabilities: { is_available: true })
                .where("DATE(fighters_availabilities.start_time) = ?", params[:date])
  end

  def show; end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)
    @fighter.user = current_user
    if @fighter.save
      # dashboard_path is a placeholder, waiting for fighter's profile (route by pages)
      redirect_to fighter_path(@fighter), notice: "Congradulation! You just created your fighter's profile."
    else
      redirect_to new_fighter_path, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @fighter.update(fighter_params)
      redirect_to dashboard_path, notice: "Your fighter's profile is updated." # :accepted
    else
      redirect_to edit_fighter_path, status: 422
    end
  end

  def destroy
    if @fighter.destroy
      redirect_to dashboard_path, warning: "Your fighter's profile is deleted."
    else
      redirect_to dashboard_path, status: 422, warning: "Oups you cannot stop fighting!"
    end
  end

  private

  def set_fighter_by_user_id
    @fighter = Fighter.find_by(user_id: params[:id])
  end

  def set_fighter
    @fighter = Fighter.find(params[:id])
  end

  def fighter_params
    params.require(:fighter).permit(
      :user_id,
      :first_name, :last_name, :nickname, :birth_date,
      :height, :weight, :fight_style, :description,
      :price, :have_insurance,
      :photo
    )
  end
end

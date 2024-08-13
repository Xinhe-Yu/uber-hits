class FightersController < ApplicationController
  before_action :set_fighter_by_user_id, only: %i[edit destroy]
  before_action :set_fighter, only: %i[show update]

  def show; end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)
    @fighter.user = current_user
    if @fighter.save
      # dashboard_path is a placeholder, waiting for fighter's profile (route by pages)
      redirect_to dashboard_path # created
    else
      p @fighter.errors
      redirect_to new_fighter_path, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @fighter.update(fighter_params)
      redirect_to dashboard_path # :accepted
    else
      redirect_to edit_fighter_path, status: 422
    end
  end

  def destroy
    if @fighter.destroy
      redirect_to dashboard_path
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
      :height, :weight, :fight_style, :description
    )
  end
end

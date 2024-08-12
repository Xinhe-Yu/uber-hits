class FightersController < ApplicationController
  before_action :set_fighter, only: %i[edit update destroy]

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)
    @fighter.user = current_user
    if @fighter.save
      # dashboard_path is a placeholder, waiting for fighter's profile (route by pages)
      redirect_to dashboard_path, status: 201 # :created
    else
      p @fighter.errors
      redirect_to new_fighter_path, status: 422 #	:unprocessable_entity
    end
  end

  def edit; end

  def update
    if @fighter.update
      redirect_to dashboard_path, status: 202 # :accepted
    else
      redirect_to edit_fighter_path, status: 422
    end
  end

  def destroy
    @fighter.destroy
  end

  private

  def set_fighter
    Fighter.find_by(user_id: params[:user_id])
  end

  def fighter_params
    params.require(:fighter).permit(
      :first_name,
      :last_name,
      :nickname,
      :birth_date,
      :height,
      :weight,
      :fight_style,
      :description
    )
  end
end

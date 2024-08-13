class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @fighters = Fighter.all
  end

  def dashboard
    @events = Event.where(user_id: current_user.id)
  end
end

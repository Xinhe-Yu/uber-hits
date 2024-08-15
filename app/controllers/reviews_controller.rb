class ReviewsController < ApplicationController
  before_action :set_event, only: %i[create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.event = @event
    @review.user_to_fighter = current_user == @event.user
    if @review.save
      redirect_to event_path(@event), notice: "You just leave a review!"
    else
      redirect_to event_path(@event), alert: "Review couldn't be created."
    end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end

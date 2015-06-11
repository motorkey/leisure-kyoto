class EventReservationsController < ApplicationController
  def create
    EventReservation.create(event_reservation_params)
    binding.pry
    redirect_to event_path(params[:event_reservation][:event_id])
  end

  private
    def event_reservation_params
      params.require(:event_reservation).permit(:name, :number, :mail, :event_day_id)
    end
end

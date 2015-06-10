class EventReservationsController < ApplicationController
  def create
    EventReservation.create(event_reservation_params)
    redirect_to event_path(1)
  end

  private
    def event_reservation_params
      params.require(:event_reservation).permit(:name, :number, :mail, :event_day_id)
    end
end

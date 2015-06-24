class EventReservationsController < ApplicationController
  def create
    if EventReservation.create(event_reservation_params)
      redirect_to pages_path
    else
      render template: 'event/show'
    end
  end

  private
    def event_reservation_params
      params.require(:event_reservation).permit(:name, :number, :mail, :event_day_id)
    end
end

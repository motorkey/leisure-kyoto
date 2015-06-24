class EventReservationsController < ApplicationController
  def create
    reservation = EventReservation.new(event_reservation_params)
    if reservation.save
      flash[:success] = "Your booking has been confirmed!"
      redirect_to pages_path
    else
      render template: 'events/show'
    end
  end

  private
    def event_reservation_params
      params.require(:event_reservation).permit(:name, :number, :mail, :event_day_id)
    end
end

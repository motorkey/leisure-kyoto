class EventReservationsController < ApplicationController
  def create
    reservation = EventReservation.new(event_reservation_params)
    if reservation.save
      flash[:success] = "Your booking has been confirmed!"
      redirect_to pages_path
    else
      # render events/show/:id ができない！
      # てか長い！何かが問題！
      redirect_to event_path(params[:event_reservation][:event_id], day: EventDay.find(params[:event_reservation][:event_day_id]).event_on) 
    end
  end

  private
    def event_reservation_params
      params.require(:event_reservation).permit(:name, :number, :mail, :event_day_id)
    end
end

class EventsController < ApplicationController
  def index
    @day = params[:day]
    # ?????
    @events = Event.joins(:days).merge(EventDay.where(event_on: @day))
  end
  def show
    @event = Event.find(params[:id])

    # indexから来た時はいいが、reservation#createから来ると:dayが存在しない！！
    #
    # dayの情報がなくこのページに来たら、トップに飛ばすかエラー出すか、今日のイベントを適当に流すか
    @reservation = @event.days.find_by(event_on: params[:day]).reservations.new
  end

  # event_reservationsのcreateじゃなくてeventsのcreateでEventReservationを扱ってもよい？
  #def create
    #reservation = EventReservation.new(event_reservation_params)
    #if reservation.save
      #flash[:success] = "Your booking has been confirmed!"
      #redirect_to pages_path
    #else
      #render 'show'
    #end
  #end
end


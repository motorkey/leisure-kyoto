class EventsController < ApplicationController
  def index
    @day = params[:day]
    # ?????
    @events = Event.joins(:days).merge(EventDay.where(event_on: @day))
  end
  def show
    @id = params[:id]
    @event = Event.find(@id)

    # indexから来た時はいいが、reservation#createから来ると:dayが存在しない！！
    @reservation = @event.days.find_by(event_on: params[:day]).reservations.new
  end
end


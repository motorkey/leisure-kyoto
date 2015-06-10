class EventsController < ApplicationController
  def index
    @day = params[:day]
    # ?????
    @events = Event.joins(:days).merge(EventDay.where(event_on: @day))
  end
  def show
    id = params[:id]
    @event = Event.find(id)
    @reservation = @event.days.find(id).reservations.new
  end
end


class EventsController < ApplicationController
  def index
    @day = params[:day]
    # ?????
    @events = Event.joins(:days).merge(EventDay.where(event_on: @day))
  end
  def show
    @id = params[:id]
    @event = Event.find(@id)
    @reservation = @event.days.find_by(event_on: '2015-06-16').reservations.new
  end
end


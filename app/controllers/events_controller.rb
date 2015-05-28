class EventsController < ApplicationController
  def index
    @day = params[:day]
    # ?????
    @events = Event.joins(:event_day).merge(EventDay.where(event_on: @day))
  end
  def show
    @event = Event.find(params[:id])
  end
end


class EventsController < ApplicationController
  def index
    @day = params[:day]
    # ?????
    @events = Event.joins(:days).merge(EventDay.where(event_on: @day))
  end
  def show
    @event = Event.find(params[:id])
  end
  def new
    @event = Event.new
  end
  def create

    puts '=======!!!!!!============='
    puts event_params

    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    def event_params
      params.require(:event).permit(:name, :image, :description)
    end
end


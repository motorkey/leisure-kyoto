class EventsController < ApplicationController
  def index
    @day = params[:day]
    @events = Event.joins(:days).merge(EventDay.where(event_on: @day))
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    @event.save

    @photo = EventPhoto.new(photo_params)
    @photo.save
    #respond_to do |format|
      #if @event.save
        #format.html { redirect_to @event, notice: 'Event was successfully created.' }
        #format.json { render action: 'show', status: created, location: @event }
      #else
        #format.html { render action: 'new' }
        #format.json { render json: @event.errors, status: :unprocessable_entity }
      #end
    #end

    puts @event

  end
  private
    def event_params
      params.require(:event).permit(:name, :description, photos: [:image])
    end
    def photo_params
      params.require(:event_photo).permit(:image)
    end
end


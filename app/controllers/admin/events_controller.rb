class Admin::EventsController < AdminController
  def index
    @events = Event.all
  end
  def new
    @event = Event.new
    3.times { @event.photos.build }
  end
  def create
    @event = Event.create(event_params)
    params[:event][:photos_attributes].each do |key, photo_attributes|
      @event.photos.create(photo_attributes.permit(:image))
    end
    #@photo = EventPhoto.new(photo_params)
    #@photo.save
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
      params.require(:event).permit(:name, :description)
    end
    #def photo_params
      #params.require(:event_photo).permit(:image)
    #end
end


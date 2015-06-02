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
    redirect_to admin_events_path
  end
  def edit
    @event = Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = '編集成功'
      redirect_to admin_events_path
    else
      render 'edit'
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :description)
    end
    #def photo_params
      #params.require(:event_photo).permit(:image)
    #end
end


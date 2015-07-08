class Admin::EventsController < AdminController
  def index
    @events = Event.all
  end
  def show
    @event = Event.find(params[:id])
  end
  def new
    @event = Event.new
    3.times { @event.photos.build }
  end
  def create
    # id @event.save を使ってrenderとredirectをちゃんとせよ！
    @event = Event.new(event_params)
    if @event.save
      # photoが１枚もないのにここにきたらエラー！validationするかなんとかせよ！
      params[:event][:photos_attributes].each do |key, photo_attributes|
        @event.photos.create(photo_attributes.permit(:image))
      end
      redirect_to admin_events_path
    else
      render 'new'
    end
  end
  def edit
    @event = Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admin_events_path
    else
      render 'edit'
    end
  end
  def destroy
    if Event.find(params[:id]).destroy
      redirect_to admin_events_path
    else
      render 'edit'
    end
  end
  private
    def event_params
      params.require(:event).permit(:name, :description, :address, :capacity)
    end
end


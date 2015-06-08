class Admin::PhotosController < AdminController
  def create
    photo = EventPhoto.new
    photo.image = params[:image]
    photo.event_id = params[:event_id]
    photo.save
    redirect_to edit_admin_event_path(photo.event_id)
  end
  def destroy
    EventPhoto.destroy(params[:id])
    @id = params[:id]
  end
end

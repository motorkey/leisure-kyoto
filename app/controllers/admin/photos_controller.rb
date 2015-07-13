class Admin::PhotosController < AdminController
  def create
    # 選択せずにupload押したときにvalidationせよ！
    photo = EventPhoto.new
    photo.image = params[:image]
    photo.event_id = params[:event_id]
    if photo.save
      redirect_to edit_admin_event_path(photo.event_id)
    end
  end
  def destroy
    EventPhoto.destroy(params[:id])
    @id = params[:id]
  end
end

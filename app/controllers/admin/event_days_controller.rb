class Admin::EventDaysController < AdminController
  def create
    # 本当は変更ごとにevent_set_days_calendarをrenderすべきなのでは？
    # 今はviewの更新をjsに任せている
    EventDay.create(event_day_params)
    render nothing: true
  end
  def destroy
    EventDay.find_by(event_day_params).destroy
    render nothing: true
  end
  private
    def event_day_params
      params.permit(:event_on, :event_id)
    end
end

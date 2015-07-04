require 'webpay'

class Front::EventReservationsController < FrontController
  def purchase
    webpay = WebPay.new('test_secret_91UfRU12fali0FVeQx8Yh677')
    webpay.charge.create(
      card: params['webpay-token'],
      amount: 10_000,
      currency: 'jpy'
    )

    # POSTでcreateにredirect_toできないためcreateアクションの処理をここに書く
    binding.pry
    reservation = EventReservation.new(event_reservation_params)
    if reservation.save
      flash[:success] = "Your booking has been confirmed!"
      redirect_to root_path
    else
      # render events/show/:id ができない！
      # てか長い！何かが問題！
      redirect_to event_path(params[:event_reservation][:event_id], day: EventDay.find(params[:event_reservation][:event_day_id]).event_on) 
    end

    rescue WebPay::ErrorResponse::CardError => e
    # エラーハンドリング。発生する例外の種類がいくつか用意されているので、内容に応じて処理を書く
    #
  end
  private
    def event_reservation_params
      params.require(:event_reservation).permit(:name, :number, :mail, :event_day_id)
    end
end

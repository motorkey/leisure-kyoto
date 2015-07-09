require 'webpay'

class Front::EventReservationsController < FrontController
  def purchase

    # transactionを使え！！

    # POSTでcreateにredirect_toできないためcreateアクションの処理をここに書く
    reservation = EventReservation.new(event_reservation_params)
    if reservation.save
      flash[:success] = "Your booking has been confirmed!"
      redirect_to root_path
    else
      # render events/show/:id ができない！
      redirect_to event_path(reservation.event_id, day: reservation.event_day.event_on) 
    end
    # 決済
    webpay = WebPay.new('test_secret_91UfRU12fali0FVeQx8Yh677')
    webpay.charge.create(
      card: params['webpay-token'],
      amount: reservation.number * reservation.event.price,
      currency: 'jpy'
    )
    rescue WebPay::ErrorResponse::CardError => e
    # エラーハンドリング。発生する例外の種類がいくつか用意されているので、内容に応じて処理を書く
    #
  end
  private
    def event_reservation_params
      params.require(:event_reservation).permit(:name, :number, :mail, :event_day_id, :event_id)
    end
end

class ReservationsController < ApplicationController
  before_action :logged_in_user, only:[:index, :confirm]

  def index
    @user = current_user
    @reservations = @user.reservations
  end
  def confirm
    @user = current_user
    # データをreservationに保存していないから、@reservation.roomは、できない。
    @reservation = Reservation.new(reservation_params)
  end
  def create
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_index_url
    else
      render 'reservations/confirm'
    end
  end

  def reservation_params
    params.require(:reservation).permit(:check_in_date, :check_out_date, :number, :dates, :total_prices, :room_id, :user_id)
  end
end

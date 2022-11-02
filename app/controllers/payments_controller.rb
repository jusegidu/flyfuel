class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
  end

  def show
    set_payment
  end

  private

  def station_params
    params.require(:payment).permit(:card_number, :exp_date, :cvv)
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end
end

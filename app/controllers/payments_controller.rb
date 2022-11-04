class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save!
      redirect_to payment_path(@payment), notice: "Tu pago ha sido exitoso."
    else
      render :new, status: :unprocessable_entity # Indica el error en el formulario y hace un renderizado
    end
  end

  def show
    set_payment
  end

  private

  def payment_params
    params.require(:payment).permit(:card_number, :exp_date, :cvv)
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end
end

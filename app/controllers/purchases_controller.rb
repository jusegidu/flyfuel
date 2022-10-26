class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def show
    set_purchase
  end

  def new
    # @product = GasStationProduct.find(params[:gas_station_product_id])
    @user = current_user
    @purchase = Purchase.new
  end

  def edit
    set_purchase
    @product = GasStationProduct.find(params[:gas_station_product_id])
  end

  def create
    @product = GasStationProduct.find(params[:gas_station_product_id])
    @purchase = Purchase.new(purchase_params)
    @purchase.gas_station_product = @product
    @purchase.user = current_user


    if @purchase.save!
      redirect_to purchase_path(@purchase), notice: "A Purchase was successfully created."
    else
      render :new, status: :unprocessable_entity # Indica el error en el formulario y hace un renderizado
    end
  end

  def update
    set_purchase
    if @purchase.update(purchase_params)
      redirect_to purchase_path(@purchase), notice: "This Purchase was successfully updated."
    else
      render :edit, status: :unprocessable_entity # Indica el error en el formulario y hace un renderizado
    end
  end

  def destroy
    set_purchase
    @purchase.destroy
    redirect_to purchases_path, status: :see_other, notice: "This Purchase was successfully destroyed."
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:quantity)
  end
end

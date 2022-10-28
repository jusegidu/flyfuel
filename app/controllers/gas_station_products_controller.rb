class GasStationProductsController < ApplicationController
  def index
    @gas_station_product = GasStationProduct.all
  end

  def show
    set_gas_station_product
  end

  # GET
  def edit
    set_gas_station_product
    @gas_station = GasStation.find(params[:gas_station_id])
  end

  def create
    @gas_station = GasStation.find(params[:gas_station_id])
    @gas_station_product = GasStationProduct.new(gas_station_product_params)
    @gas_station_product.gas_station = @gas_station
    if @gas_station_product.save!
      redirect_to gas_station_path(@gas_station), notice: "The product was successfully created in the station."
    else
      render :new, status: :unprocessable_entity # Indica el error en el formulario y hace un renderizado
    end
  end

  # PATCH/PUT
  def update
    set_gas_station_product
    if @gas_station_product.update(gas_station_product_params)
      redirect_to gas_station_path(@gas_station_product.gas_station), notice: "This Product was successfully updated in the station."
    else
      render :edit, status: :unprocessable_entity # Indica el error en el formulario y hace un renderizado
    end
  end

  # DELETE
  def destroy
    set_gas_station_product
    @gas_station_product.destroy
    @gas_station = GasStation.find(params[:gas_station_id])
    redirect_to gas_station_path(@gas_station), status: :see_other, notice: "This Product was successfully destroyed in the station."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gas_station_product
    @gas_station_product = GasStationProduct.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gas_station_product_params
    params.require(:gas_station_product).permit(:price, :product_id)
  end
  # def new
  #   @gas_station = GasStation.find(params[:gas_station_id])
  #   @gas_station_product = GasStationProduct.new
  # end

  # def create
  #   @gas_station = GasStation.find(params[:gas_station_id])
  #   @gas_station_product = GasStationProduct.new(product_params)
  #   @gas_station_product.gas_station = @gas_station
  #   @gas_station_product.save
  # end

  # def edit

  # end

  # private

  # def product_params
  #   params.require(:gas_station_product).permit(:price)
  # end
end

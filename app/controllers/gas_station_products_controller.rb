class GasStationProductsController < ApplicationController
  def new
    @gas_station = GasStation.find(params[:gas_station_id])
    @gas_station_product = GasStationProduct.new
  end

  def create
    @gas_station = GasStation.find(params[:gas_station_id])
    @gas_station_product = GasStationProduct.new(product_params)
    @gas_station_product.gas_station = @gas_station
    @gas_station_product.save
  end

  def edit

  end

  private

  def product_params
    params.require(:gas_station_product).permit(:price)
  end
end

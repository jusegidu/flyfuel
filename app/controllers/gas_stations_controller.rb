require 'rest-client'
require 'json'
class GasStationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    # @location = params[:query]
    # @test = Geocoder.search(@location)
    # source_coordenates_as_string = @test.first.data["lat"].to_s + "," + @test.first.data["lon"].to_s + ";"
    # destinations_coordenates_as_string = generate_gas_station_coordenates_string
    # coordenates = source_coordenates_as_string + destinations_coordenates_as_string
    #  # link = "https://api.mapbox.com/directions-matrix/v1/mapbox/driving/#{coordenates}?sources=0&destinations=1;2;3;4;5&access_token=pk.eyJ1IjoianVzZWdpZHUiLCJhIjoiY2w2eTZ1M2RoMnl4dTNkcjM4OTY1MHZqbSJ9.-ALdGK2TsDDx3E7zv2ppYw"
    # link = "https://api.mapbox.com/directions-matrix/v1/mapbox/driving/-122.42,37.78;-122.45,37.91;-122.48,37.73?approaches=curb;curb;curb&access_token=pk.eyJ1IjoianVzZWdpZHUiLCJhIjoiY2w2eTZ1M2RoMnl4dTNkcjM4OTY1MHZqbSJ9.-ALdGK2TsDDx3E7zv2ppYw"
    # response = RestClient.get(link)
    # repos = JSON.parse(response)
    # raise
    if @location
      @stations = GasStation.all
      #  @stations.each do |station|
      #    getRoute(start, end)
      # end
    else
      @stations = GasStation.all
    end

    @markers = @stations.geocoded.map do |station|
      {
        lat: station.latitude,
        lng: station.longitude,
        info_window: render_to_string(partial: "info_window", locals: {station: station}),
        image_url: helpers.asset_url("logo.png")
      }
    end
  end

  def show
    set_station
  end

  def new
    @station = GasStation.new
  end

  # GET
  def edit
    set_station
  end

  def create
    @station = GasStation.new(station_params)
    @station.user = current_user

    if @station.save!
      redirect_to gas_stations_path, notice: "Gas Station was successfully created."
    else
      render :new, status: :unprocessable_entity # Indica el error en el formulario y hace un renderizado
    end
  end

  # PATCH/PUT
  def update
    set_station
    if @station.update(station_params)
      redirect_to gas_station_path(@station), notice: "This Gas Station was successfully updated."
    else
      render :edit, status: :unprocessable_entity # Indica el error en el formulario y hace un renderizado
    end
  end

  # DELETE
  def destroy
    set_station
    @station.destroy
    redirect_to root_path, notice: "This Gas station was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_station
    @station = GasStation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def station_params
    params.require(:gas_station).permit(:name, :address, :latitude, :longitude, :photo)
  end

  def generate_gas_station_coordenates_string
    string = ""
    GasStation.all.pluck(:latitude,:longitude).each do |array|
      coordenates = array.join(",") + ";"
      string += coordenates
    end
    return string.chop
  end
end

class GasStationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @stations = GasStation.all
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
      redirect_to station_path(@station), notice: "Gas Station was successfully created."
    else
      render :new, status: :unprocessable_entity # Indica el error en el formulario y hace un renderizado
    end
  end

  # PATCH/PUT
  def update
    set_station
    if @station.update(station_params)
      redirect_to station_url(@station), notice: "This GasStation was successfully updated."
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
    params.require(:GasStation).permit(:name, :address, :latitud, :longitud)
  end
end

class TruckDriversController < ApplicationController
  before_action :set_truck_driver, only: [:show, :update, :destroy]

  # GET /truck_drivers
  def index
    @truck_drivers = TruckDriver.all

    render json: @truck_drivers
  end

  # GET /truck_drivers/1
  def show
    render json: @truck_driver
  end

  # POST /truck_drivers
  def create
    @truck_driver = TruckDriver.new(truck_driver_params)

    if @truck_driver.save
      render json: @truck_driver, status: :created, location: @truck_driver
    else
      render json: @truck_driver.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /truck_drivers/1
  def update
    if @truck_driver.update(truck_driver_params)
      render json: @truck_driver
    else
      render json: @truck_driver.errors, status: :unprocessable_entity
    end
  end

  # DELETE /truck_drivers/1
  def destroy
    @truck_driver.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck_driver
      @truck_driver = TruckDriver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def truck_driver_params
      return {} unless params.has_key?(:truck_driver)
      params.require(:truck_driver).permit(:name)
    end
end

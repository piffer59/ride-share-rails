class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    driver_id = params[:id].to_i
    @driver = Driver.find_by(id: driver_id)
    if @driver.nil?
      head :not_found
    end
  end

  def new
    @driver = Driver.new(name: "Name")
  end

  def create
    driver = Driver.new(driver_params)

    is_successful = driver.save

    if is_successful
      redirect_to driver_path(driver.id)
    else
      head :bad_request
    end
  end

  def edit
    driver_id = params[:id].to_i
    @driver = Driver.find_by(id: driver_id)

    if @driver.nil?
      redirect_to drivers_path
    end
  end

  def update
    # edit_driver_id = params[:id].to_i
    edited_driver = Driver.find_by(id: params[:id].to_i)

    if edited_driver != nil
      edited_driver.update(driver_params)
      redirect_to driver_path(edited_driver.id)
    else
      @driver = edited_driver
      render :edit, status: :bad_request
    end
  end

  def delete
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

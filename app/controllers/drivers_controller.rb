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
  end

  def edit
  end

  def update
  end

  def delete
  end
end

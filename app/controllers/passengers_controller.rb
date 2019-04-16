class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    passenger_id = params[:id].to_i
    @passenger = Passenger.find_by(id: passenger_id)
    if @passenger.nil?
      head :not_found
    end
  end

  def new
    @passenger = Passenger.new(name: "Name")
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

class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    trip_id = params[:id].to_i
    @trip = Trip.find_by(id: trip_id)
    if @trip.nil?
      head :not_found
    end
  end

  def new
    passenger = Passenger.find_by(id: params[:id])
    @trip = Trip.new(date: Date.now, passenger_id: passenger.id, driver_id: Driver.first.id)
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

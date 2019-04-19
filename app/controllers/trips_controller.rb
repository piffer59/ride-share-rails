class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
    end
  end

  def new
    # selects a random driver using rand
    # Shamira, right now using Driver.rand doesn't work - form won't render. I don't know that you can call rand directly on Drivers because it's not a regular array.
    passenger = Passenger.find_by(id: params[:passenger_id])
    driver = Driver.first
    @trip = Trip.new(date: Date.today, passenger_id: passenger.id, driver_id: driver.id)
  end

  def create
    @trip = Trip.new(trip_params)

    is_successful = @trip.save

    if is_successful
      redirect_to trip_path(@trip.id)
      # redirect_to trip_path(@trip.id)
      # redirect_to passenger_path(@trip.passenger_id)
    else
      render :new, status: :bad_request
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    trip = Trip.find_by(id: params[:id])

    is_successful = trip.update(trip_params)

    if is_successful
      redirect_to trip_path(trip.id)
    else
      @trip = trip
      render :edit, status: :bad_request
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id])

    if trip.nil?
      head :not_found
    else
      trip.destroy
      redirect_to trips_path
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:date, :rating, :cost, :driver_id, :passenger_id)
  end
end

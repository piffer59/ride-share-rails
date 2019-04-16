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
    passenger = Passenger.new(passenger_params)

    is_successful = passenger.save

    if is_successful
      redirect_to passenger_path(passenger.id)
    else
      head :bad_request
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end

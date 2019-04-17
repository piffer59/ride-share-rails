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
    passenger_id = params[:id].to_i
    @passenger = Passenger.find_by(id: passenger_id)

    if @passenger.nil?
      redirect_to passengers_path
    end
  end

  def update
    edit_passenger_id = params[:id].to_i
    edited_passenger = Passenger.find_by(id: edit_passenger_id)

    if edited_passenger != nil
      edited_passenger.update(passenger_params)
      redirect_to passenger_path(edited_passenger.id)
    else
      @passenger = edited_passenger
      render :edit, status: :bad_request
    end
  end

  def delete
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end

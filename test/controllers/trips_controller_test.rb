require "test_helper"

describe TripsController do
  describe "index" do
  end

  describe "show" do
    # Your tests go here
  end

  describe "new" do
    it "can create a new trip" do
    end
  end

  describe "create" do
    it "can save a new trip" do
      driver = Driver.create(name: "name", vin: "vin")
      passenger = Passenger.create(name: "passenger", phone_num: "12343")

      trip_hash = {
        trip: {
          date: Date.today,
          driver_id: driver.id,
          passenger_id: passenger.id,
        },
      }

      expect {
        post trips_path, params: trip_hash
      }.must_change "Trips.count", 1
    end
  end

  describe "edit" do
    # Your tests go here
  end

  describe "update" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end

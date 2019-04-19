require "test_helper"

describe TripsController do
  let (:trip) {
    Trip.create date: Date.today, driver_id: 4, passenger_id: 3
  }
  describe "index" do
    it "can get the index path" do
      get trips_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "get get a valid trip" do
      get trip_path(trip.passenger_id)

      must_respond_with :success
    end
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
      }.must_change "Trip.count", 1
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

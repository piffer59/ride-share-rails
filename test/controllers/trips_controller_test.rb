require "test_helper"
require "pry"

describe TripsController do
  let (:trip) {
    Trip.create(date: Date.today, rating: 4, cost: 7, driver_id: 4, passenger_id: 8)
  }
  let (:driver) {
    Driver.create(name: "name", vin: "vin")
  }
  let (:passenger) {
    Passenger.create(name: "passenger", phone_num: "12343")
  }
  describe "index" do
    it "can get the index path" do
      get trips_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "get get a valid trip" do
      # Act
      trip_new = Trip.create(date: Date.today, rating: 4, cost: 7, driver_id: driver.id, passenger_id: passenger.id)
      get trip_path(trip_new.id)

      # Assert
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
    it "can edit an existing trip" do
      driver = Driver.create(name: "name", vin: "vin")
      passenger = Passenger.create(name: "passenger", phone_num: "12343")

      existing_trip = Trip.create(date: Date.today, passenger_id: passenger.id, driver_id: driver.id)

      get edit_trip_path(existing_trip.id)

      must_respond_with :success
    end
  end

  describe "update" do
    it "can update an existing trip" do
      existing_trip = Trip.create(date: Date.today, cost: 0, rating: 4, passenger_id: passenger.id, driver_id: driver.id)

      update_trip_hash = {
        trip: {
          date: existing_trip.date,
          cost: 123,
          rating: 5,
          passenger_id: existing_trip.passenger_id,
          driver_id: existing_trip.driver_id,
        },
      }

      patch trip_path(existing_trip), params: update_trip_hash

      existing_trip.reload
      expect(existing_trip.cost).must_equal 123
    end
  end

  describe "destroy" do
    it "can delete a trip" do
      trip_to_delete = Trip.create(date: Date.today, rating: 4, cost: 7, driver_id: driver.id, passenger_id: passenger.id)

      expect {

        # Act
        delete trip_path(trip_to_delete.id)

        # Assert
      }.must_change "Trip.count", -1

      must_respond_with :redirect
      must_redirect_to trips_path
    end
  end
end

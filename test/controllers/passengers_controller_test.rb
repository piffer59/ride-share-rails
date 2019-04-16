require "test_helper"

describe PassengersController do
  let (:passenger) {
    Passenger.create name: "Ridley", phone_num: "333-444-5555"
  }
  describe "index" do
    it "can get the index path" do
      # Act
      get passengers_path

      # Assert
      must_respond_with :success
    end

    it "can get the root path" do
      # Act
      get root_path

      # Assert
      must_respond_with :success
    end
  end

  describe "show" do
    it "can get a valid Passenger" do

      # Act
      get passenger_path(passenger.id)

      # Assert
      must_respond_with :success
    end

    it "will redirect for an invalid task" do

      # Act
      get passenger_path(-1)

      # Assert
      must_respond_with :not_found
    end
  end

  describe "edit" do
    # Your tests go here
  end

  describe "update" do
    # Your tests go here
  end

  describe "new" do
    # Your tests go here
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end

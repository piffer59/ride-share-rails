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

  describe "new" do
    it "can get the new passenger page" do
      get new_passenger_path

      must_respond_with :success
    end
  end

  describe "create" do
    it "can save a new passenger" do
      passenger_hash = {
        passenger: {
          name: "new name",
          phone_num: "my phone number",
        },
      }

      # Act-Assert
      expect {
        post passengers_path, params: passenger_hash
      }.must_change "Passenger.count", 1

      new_passenger = Passenger.find_by(name: passenger_hash[:passenger][:name])
      expect(new_passenger.phone_num).must_equal passenger_hash[:passenger][:phone_num]

      must_respond_with :redirect
      must_redirect_to passenger_path(new_passenger.id)
    end
  end

  describe "edit" do
    it "can edit a existing passenger" do
      #Arrange
      existing_passenger = Passenger.create(name: "Mr. Bob")

      # Act
      get edit_passenger_path(existing_passenger)
      # Assert
      must_respond_with :success
    end
  end

  describe "update" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end

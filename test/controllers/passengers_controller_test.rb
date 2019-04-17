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

    it "will redirect for an invalid passenger" do

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

    it "will not save a passenger without required information/validation" do
      new_passenger = Passenger.create(name: "passenger with no phone-num")

      expect(new_passenger.valid?).must_equal false
    end
  end

  describe "edit" do
    it "can edit a existing passenger" do
      #Arrange
      existing_passenger = Passenger.create(name: "Mr. Bob", phone_num: "333333333")

      # Act
      get edit_passenger_path(existing_passenger)
      # Assert
      must_respond_with :success
    end

    it "will respond with redirect when attempting to edit a nonexistant Passenger" do
      bad_passenger_id = "THIS IS INVALID"
      # Act
      get edit_passenger_path(bad_passenger_id)
      # Assert
      must_redirect_to passengers_path
    end
  end

  describe "update" do
    it "can update an existing passenger" do
      update_passenger_hash = {
        passenger: {
          name: "existing name",
          phone_num: "new number",
        },
      }
      existing_passenger = Passenger.create(name: "existing name", phone_num: "old number")

      patch passenger_path(existing_passenger), params: update_passenger_hash

      existing_passenger.reload
      expect(existing_passenger.phone_num).must_equal "new number"
    end

    # it "will redirect to the edit page if given an invalid id" do
    #   # Arrange
    #   update_passenger_hash = {
    #     passenger: {
    #       name: "update passenger",
    #       phone_num: "update number",
    #     },
    #   }
    #   invalid_passenger_id = "Invalid"
    #   #Act
    #   patch passenger_path(invalid_passenger_id), params: update_passenger_hash
    #   # Assert

    #   must_redirect_to edit_passenger_path
    # end
  end

  describe "destroy" do
    it "returns a 404 if the passenger is not found" do
      # Arrange
      invalid_passenger_id = "NOT A VALID ID"

      expect {
        # Act
        delete passenger_path(invalid_passenger_id)
      }.wont_change "Passenger.count"
      must_respond_with :not_found
    end
  end
end

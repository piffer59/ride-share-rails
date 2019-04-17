require "test_helper"

describe DriversController do
  let (:driver) {
    Driver.create name: "Ridley", vin: "R1CKRVH55W8S6S9T9"
  }
  describe "index" do
    it "can get the index path" do
      # Act
      get drivers_path

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
    it "can get a valid Driver" do

      # Act
      get driver_path(driver.id)

      # Assert
      must_respond_with :success
    end

    it "will redirect for an invalid driver" do

      # Act
      get driver_path(-1)

      # Assert
      must_respond_with :not_found
    end
  end

  describe "new" do
    it "can get the new driver page" do
      get new_driver_path

      must_respond_with :success
    end
  end

  describe "create" do
    it "can save a new driver" do
      driver_hash = {
        driver: {
          name: "Driver X",
          vin: "1sdf3vin",
        },
      }

      expect {
        post drivers_path, params: driver_hash
      }.must_change "Driver.count", 1

      new_driver = Driver.find_by(name: driver_hash[:driver][:name])

      expect(new_driver.vin).must_equal driver_hash[:driver][:vin]

      must_respond_with :redirect
      must_redirect_to driver_path(new_driver.id)
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

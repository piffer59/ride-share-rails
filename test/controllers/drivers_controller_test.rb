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
    it "can edit an existing driver" do
      existing_driver = Driver.create(name: "Driver X", vin: "2123tdfvsdf")

      get edit_driver_path(existing_driver.id)

      must_respond_with :success
    end
  end

  describe "update" do
    it "can update an existing driver" do
      update_driver_hash = {
        driver: {
          name: "existing name",
          vin: "new vin",
        },
      }
      existing_driver = Driver.create(name: "existing name", vin: "old vin")

      patch driver_path(existing_driver), params: update_driver_hash

      existing_driver.reload
      expect(existing_driver.vin).must_equal "new vin"
    end
  end

  describe "destroy" do
    it "can delete a driver" do
      # Arrange - Create a task
      new_driver = Driver.create(name: "Driver to delete", vin: "vin to delete")

      expect {

        # Act
        delete driver_path(new_driver.id)

        # Assert
      }.must_change "Driver.count", -1

      must_respond_with :redirect
      must_redirect_to drivers_path
    end

    it "returns a 404 if the driver is not found" do
      invalid_id = "NOT A VALID ID"

      delete driver_path(invalid_id)

      must_respond_with :missing
    end
  end
end

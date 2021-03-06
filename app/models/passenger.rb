class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def list_passenger_trips
    trips = []
    self.trips.each do |trip|
      trips << trip
    end
    return trips
  end

  def charges
    money = 0
    self.trips.each do |trip|
      if trip.cost == nil
        money += 0
      else
        trip.cost
        money += trip.cost
      end
    end
    return money
  end
end

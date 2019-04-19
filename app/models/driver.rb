class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true

  def list_driver_trips
    trips = []
    self.trips.each do |trip|
      trips << trip
    end
    return trips
  end

  def earnings
    revenue = 0

    self.trips.each do |trip|
      if trip.cost < 165
        revenue += 100
      elsif trip.cost == nil
        revenue += 0
      else
        revenue += ((trip.cost - 165) * 0.8)
      end
    end

    return revenue
  end

  def average_rating
    rating = 0

    self.trips.each do |trip|
      rating += trip.rating.to_f
    end

    return self.trips.length > 0 ?
             (rating / self.trips.length) : rating
  end
end

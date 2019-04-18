class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true

  def earnings
    revenue = 0

    self.trips.each do |trip|
      if trip.cost < 165
        revenue += 100
      else
        revenue += ((trip.cost - 165) * 0.8)
      end
    end

    return revenue
  end
end

class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def charges
    self.trips.each do |trip|
      trip.cost
    end
  end
end

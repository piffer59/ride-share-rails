class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def charges
    money = 0
    self.trips.each do |trip|
      money += trip.cost
    end
    return money
  end
end

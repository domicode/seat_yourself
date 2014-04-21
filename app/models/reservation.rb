class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :restaurant, presence: true
  validates :seats, presence: true
  validate :availability

  def availability
    if !restaurant.availability(seats, time, restaurant, user)
      errors.add(:base, "The restaurant is full")
    end
  end

end

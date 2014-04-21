class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :restaurant, presence: true
  validates :seats, presence: true
  validates :seats, numericality: { greater_than_or_equal_to: 1 }
  validate :availability

  def availability
    if seats == nil
      errors.add(:base, "Please add a number of seats")
    elsif !restaurant.availability(seats, time, restaurant, user)
      errors.add(:base, "The restaurant is full")
    end
  end

  def end_time
    start_time + 2.hours
  end

  def available_between(start_time, end_time)

  end

end

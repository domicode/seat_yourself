class Restaurant < ActiveRecord::Base

  has_many :reservations
  has_many :users, :through => :reservations

  def availability(seats, time, restaurant, user)
    taken_seats = reservations.where(time: time).sum(:seats)
    taken_seats + seats <= capacity
  end

end

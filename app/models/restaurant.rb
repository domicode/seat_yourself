class Restaurant < ActiveRecord::Base

  has_many :reservations
  has_many :users, :through => :reservations
  # has_many :patrons, through: :reservations, class: "User"

  # belongs_to :owner, class: "User", foreign_key: "owner_id"


  def availability(seats, time, restaurant, user)
    taken_seats = reservations.where(time: ((time-2.hours+1.minute)..(time+2.hours-1.minute))).sum(:seats)
    puts taken_seats
    taken_seats + seats <= capacity
  end



end

class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end


  def show
    @reservation = Reservation.find(params[:id])
  end

  def new

  end

  def create
    reservation_params
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(seats: @seats, time: @time, restaurant_id: @restaurantid, user_id: current_user.id)
    if @reservation.save
      redirect_to @restaurant, notice: "Reservation was saved sucessfully"
    else
      render :show
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end


  private

  def reservation_params
    @year = params[:time]["time(1i)"].to_i
    @month = params[:time]["time(2i)"].to_i
    @day = params[:time]["time(3i)"].to_i
    @hour = params[:time]["time(4i)"].to_i
    @minute = params[:time]["time(5i)"].to_i
    @time = Time.new(@year, @month, @day, @hour, @minute)
    @user = params[:reservation][:user_id]
    @seats = params[:reservation][:seats]
    @restaurantid = params[:reservation][:restaurant_id]
    params.require(:reservation).permit(:seats, @time, :user_id, :restaurant_id,)
  end


end

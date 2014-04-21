class RestaurantsController < ApplicationController

  before_action :load_restaurant

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant
    @reservation = @restaurant.reservations.build
    # @taken_seats = @restaurant.reservations.sum(:seats)
    # @empty_seats = @restaurant.capacity - @taken_seats   
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      reirect_to restaurants_path
    else
      render :new
    end
  end

  def edit
    @restaurant 
  end

  def update
    @restaurant 
    if @restaurant.update_attributes(restaurant_params)
      redirect_to @restaurant
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end


  private 

  def restaurant_params
    params.require(:restaurant).permit(:name, :capacity)
  end

  def load_restaurant
    if params[:id].nil?
      @restaurant = Restaurant.all
    else
      @restaurant = Restaurant.find(params[:id])
    end
  end

end

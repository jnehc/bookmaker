class RestaurantsController < ApplicationController

  def index
  	@restaurants = Restaurant.all
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  end

  def new
  	@restaurant = Restaurant.new
  end

  def edit
  	@restaurant = Restaurant.find(params[:id])
  end

  def create
  	@restaurant = Restaurant.new(restaurant_params)

  	if @restaurant.save
  		redirect_to restaurants_url(@restaurant)

  	else
  		render :new
  	end

  end

  private
  def restaurant_params
  	params.require(:restaurant).permit(:name, :description, :address, :phone_number, :category, :capacity)
  end

end

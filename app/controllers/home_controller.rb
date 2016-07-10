class HomeController < ApplicationController
  def index
  end

  def contact_us
  end

  def menu
  	if params[:section]
  		@food_items = FoodItem.page(params[:page]).per(5).where section: params[:section]
  	else
  		@food_items = FoodItem.all.page(params[:page]).per(5)
  	end
  end
end

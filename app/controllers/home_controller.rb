class HomeController < ApplicationController
  def 	index
  end

  def contact_us
  end

  def menu
  	@section = %w(Breakfast Lunch Dinner Drinks)

  	if params[:section]
  		@food_items = FoodItem.by_section(params[:section]).order(params[:sort_param])
  	else
  		@food_items = FoodItem.all.order(params[:sort_param	])
  	end
  end


end

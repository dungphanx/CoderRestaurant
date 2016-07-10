class OrdersController < ApplicationController
	def new
		@food_item = FoodItem.find params[:food_item_id]
	end

	def create
		@food_item = FoodItem.find params[:food_item_id]

		@oder = Oder.new(order_params)
		@oder.food_item = @food_item

		if @order.save
			respond_to do |format|
				order_finish_url = get_order_url @order.food_item_id

		end
		else
			render 'new'
		end
	end

	def show
	end


end

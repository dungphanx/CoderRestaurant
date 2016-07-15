class OrdersController < ApplicationController
	def new
		@food_item = FoodItem.find params[:food_item_id]
	end

	def create
		@food_item = FoodItem.find params[:food_item_id]

		@order = Order.new(order_params)
		@order.food_item = @food_item

		if @order.save
			respond_to do |format|
				order_finish_url = get_order_url @order.id

				#begin
				#UserMailer.welcome_email(@order, order_finish_url).deliver_later
				#flash[:success] = "Order subitted, Thankyou!"
				#rescue
				#flash[:success] = "Order subitted, but some problem with Gmail Authentication, thankyou!"
				#end


				format.html{ redirect_to controller: 'orders', action: 'show', id: @order.id}
			end
		else
			flash[:error] = "Error: #{@order.errors.full_messages.to_sentence}"
			render 'new'
		end
	end

	def show
		@food_item = FoodItem.find params[:food_item_id]
		@order = Order.find params[:id]
		bill()
	end

	private
	def order_params
		params.require(:order).permit(:name, :phone, :address, :email, :quantity, :coupon_code)
	end

	def bill
		@delivery_fee = 20
		@food_fee = @food_item.price * @order.quantity
		@total = @delivery_fee + @food_fee

		if @order.coupon_code == "CODERSCHOOL"
			@discount = @total/2
			@total = @total/2
			@isDiscount = true
		end
	end

	def get_order_url(order_id)
		value = url_for :controller => 'orders', :action => 'show', :id => order_id
	end
end

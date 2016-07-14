class CommentsController < ApplicationController
	def create
		@food_item = FoodItem.find params[:food_item_id]

		@comment = Comment.new(comment_params)
		@comment.food_item = @food_item

		if @comment.save
			flash[:success] = "Comment submitted"
			redirect_to food_item_path(@food_item)
		else
			flash[:error] = "Error: #{@comment.errors.full_messages.to_sentence}"
			redirect_to food_item_path(@food_item)
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:title, :body, :rating)
	end
end

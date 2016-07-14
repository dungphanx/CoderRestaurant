class ApplicationMailer < ActionMailer
  default from: 'dungphanx@gmail.com'

  def welcome_email(order, order_url)
  	@order = order
  	@uil = order_url
  	mail(to: @order.email, subject: 'Your Order has been success!')
  end
end

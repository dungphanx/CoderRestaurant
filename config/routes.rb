Rails.application.routes.draw do
  resources :food_items do
  	resources :orders
  end

  root 'home#index'

  get 'menu' => 'home#menu'
  get 'contact_us' => 'home#contact_us'
  get 'food_items/:food_item_id/orders/done/:id', to: 'orders#done', as: 'done_orders'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

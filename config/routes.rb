Rails.application.routes.draw do
  resources :food_items do
  	resources :orders
  end

  root 'home#index'

  get 'menu' => 'home#menu'
  get 'contact_us' => 'home#contact_us'
  get 'orders/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

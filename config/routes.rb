Rails.application.routes.draw do
  
  
  get 'admin/index'
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
end

  #Deleted Lab 10
  #get 'sessions/new'

  #get 'sessions/create'

  #get 'sessions/destroy'

  resources :users
  resources :orders
  resources :line_items
  resources :carts
  get 'store/index'

  resources :products
  get 'static_pages/home'

  get 'static_pages/help'

  get 'static_pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'store#index'

end

Rails.application.routes.draw do
  get 'invitations/new'

  get 'invitations/create'

  root                  'basic_pages#home'

  get 'contact' =>  'basic_pages#contact'

  get 'about'    =>  'basic_pages#about'
  
  get 'faq'     =>  'basic_pages#faq'
  
  get 'signup'  => 'users#new'
  
  get 'howitworks' => 'basic_pages#howitworks'
  
  get 'newbiz' => 'businesses#new'
  
  get 'login'  => 'sessions#new'
  
  post 'login'   =>   'sessions#create'
  
  delete 'logout'   =>   'sessions#destroy'
  
  post 'users/set_geolocation' => 'users#set_geolocation'
  
  post 'users/business_index' => 'users#business_index'
  
  get 'manager' => 'users#manager'
  
  get 'feedback' => 'users#feedback'
  
  get 'joinlist' => 'invitations#joinlist'
  
  resources :users
  
  resources :businesses
  
  resources :vip_codes
  
  get 'vipcode' => 'vip_codes#new'
  
  resources :reviews, only: [:create, :destroy]
  
  get 'instructreview' => 'reviews#instructreview'
  
  get "vipcode" => 'invitations#vipcode'
  
  get 'feedback' => 'reviews#feedback'
  
  resources :invitations
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

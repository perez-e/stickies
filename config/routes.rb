Stickies::Application.routes.draw do
  root to: "main#index"

  devise_for :users, skip: [:sessions, :registrations]

  devise_scope :user do 
    get 'signup' => 'devise/registrations#new', :as => :new_user_registration 
    post 'signup' => 'devise/registrations#create', :as => :user_registration 
    get 'users/cancel' => 'devise/registrations#cancel', :as => :cancel_user_registration 
    get 'users/edit' => 'devise/registrations#edit', :as => :edit_user_registration 
    put 'users' => 'devise/registrations#update' 
    delete 'users/cancel' => 'devise/registrations#destroy' 

    get 'signin' => 'devise/sessions#new', :as => :new_user_session 
    post 'signin' => 'devise/sessions#create', :as => :user_session 
    get 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session 
  end 

  resources :stickies

  get "/view/free", to: "view#free"
  get "/view/grid", to: "view#grid"
  get "/view/list", to: "view#list"
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

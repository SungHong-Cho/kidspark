Kidspark::Application.routes.draw do
  resources :sessions
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destory', as: 'logout'

  match 'mobile_jumping/index' => 'mobile_jumping#index', as:'mobile_jumping_index'
 
  match 'mobile_jumping/detail/:id'=>'mobile_jumping#detail', as:'mobile_jumping_detail'

  get "mobile_gallery/index"

  get "mobile_facilities/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'photos#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  get 'photos/index', to: 'photos#index'
  post 'photos/index', to: 'photos#index'
  post 'photos', to: 'photos#create'
  match 'about/index'=>'about#index'
  match 'photos/detail/:id'=>'photos#detail', :as => 'photos_detail'
  match 'scatch/index' => 'scatch#index'
  match 'tocome/index' => 'tocome#index'
  match 'photos/download/:id'=>'photos#download', :as => 'photos_download'
  match 'photos/destroy'=>'photos#destroy', :as => 'photos_destroy'
  match 'photos/destroy_all'=>'photos#destroy_all', :as => 'photos_destroy_all'
end

Rails.application.routes.draw do
#<<<<<<< HEAD

  resources :announcements, only: [:index, :show]
#=======
#>>>>>>> de5e2ada98da12590ffd8dc214a6eee08b2cdc24
  resources :lessons
  devise_for :users
  devise_for :teachers
  devise_for :admins
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
  namespace :admin do
    resources :dashboard, only: :index
    root 'dashboard#index'
    resources :announcements
    resources :events
    resources :teachers, except: [:create, :new] do
      post :block, on: :member
      post :unblock, on: :member
      post :block_all, on: :collection
    end
    resources :users, except: [:create, :new] do
      post :block, on: :member
      post :unblock, on: :member
      post :block_all, on: :collection
    end
  end

  namespace :teacher do
    resources :lessons
    root 'lessons#index'
  end
end

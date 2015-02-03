Rails.application.routes.draw do

  resources :announcements, only: [:index, :show]
  resources :lessons


  get 'lessons/show'
  get 'memberships/index'

  resource :memberships, only: [:create, :index]

  resources :announcements, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :lessons, only: [:show]

  devise_for :users
  devise_for :teachers
  devise_for :admins
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  namespace :admin do
    resources :dashboard, only: :index
    root 'dashboard#index'
    resources :announcements
    resources :events
    resources :lessons
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
    resources :admins do
      post :block, on: :member
      post :unblock, on: :member
      post :block_all, on: :collection
    end
  end

  namespace :teacher do
    resources :lessons do
      resources :users
    end
    resources :dashboard, only: :index
    root 'dashboard#index'
  end
end

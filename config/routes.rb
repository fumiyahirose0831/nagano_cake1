Rails.application.routes.draw do



   devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  root to: 'homes#top'
  get  "about"  => "homes#about"

  scope module: :public do

    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/unsubscribes' => 'customers#unsubscribes'
    patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    resources :addresses
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    post 'orders/comfirm' => 'orders#comfirm'

    resources :orders
  end

   devise_for :customers, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  namespace :admin do

    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
    root to: 'homes#top'

  end
 end
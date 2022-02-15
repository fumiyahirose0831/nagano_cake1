Rails.application.routes.draw do
   devise_for :customers, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }
  
  
   devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  root to: 'homes#top'

  namespace :admin do
    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
  end
end

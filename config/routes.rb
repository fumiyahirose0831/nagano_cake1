Rails.application.routes.draw do
  devise_for :admins
  
  root to: 'homes#top'
  
  namespace :admin do
    resources :items
  end
end

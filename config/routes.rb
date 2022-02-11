Rails.application.routes.draw do
  devise_for :admins
  root to: 'homes#top'
end

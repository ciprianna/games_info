Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :games
  get 'app', to: 'games#index'
end

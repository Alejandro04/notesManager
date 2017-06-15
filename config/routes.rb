Rails.application.routes.draw do
  resources :notes
  resources :categories
  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'authentication#create'
end

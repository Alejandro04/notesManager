Rails.application.routes.draw do
  resources :categories
  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'authentication#create'
end

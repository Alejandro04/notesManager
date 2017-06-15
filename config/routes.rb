Rails.application.routes.draw do
  resources :notes
  resources :categories
  get '/', to: 'authentication#login'
  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'authentication#create'
  get 'categoriesview', to: 'categories#indexview'
end

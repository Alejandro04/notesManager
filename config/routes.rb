Rails.application.routes.draw do
  resources :notes
  resources :categories
  get '/', to: 'authentication#login'
  get 'login', to: 'authentication#authenticate'
  get 'logout', to: 'authentication#destroy'
  post 'signup', to: 'authentication#create'
  get 'categoriesview', to: 'categories#indexview'
  get 'notesview', to: 'notes#indexview'
end

Rails.application.routes.draw do
  resources :notes
  resources :categories
  get '/', to: 'authentication#login'
  get 'register', to: 'authentication#register'
  get 'login', to: 'authentication#authenticate'
  get 'logout', to: 'authentication#destroy'
  get 'signup', to: 'authentication#create'
  get 'categoriesview', to: 'categories#indexview'
  get 'categoriesnew', to: 'categories#new'
  get 'notesview', to: 'notes#indexview'
  get 'categoriescreate', to: 'categories#create'
  get 'notesnew', to: 'notes#new'
  get 'notescreate', to: 'notes#create'

end

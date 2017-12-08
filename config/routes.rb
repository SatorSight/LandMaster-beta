Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'main#index'
  get '/new', to: 'main#new'
  post '/create', to: 'main#create'
  get '/page/:url', to: 'main#page'
  get '/edit/:id', to: 'main#edit'
  post 'update', to: 'main#update'
  get '/delete/:id', to: 'main#delete'
end
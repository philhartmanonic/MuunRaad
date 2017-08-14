Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'muuns#home'
  get 'moons/date', to: 'muuns#date'
  post 'moons/date', to: 'muuns#date'
  root 'muuns#home'
  get 'muuns/:id', to: 'muuns#show'
  get 'muuns', to: 'muuns#index'
end

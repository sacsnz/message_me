Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'sessions#home'
  
  get 'login', to: 'sessions#login'
  
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "babies#index"

  resources :babies
  resources :breatsfeedings
  
end

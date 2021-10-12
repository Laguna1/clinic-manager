Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :patients
  resources :doctors
  resources :appointments

  root 'doctors#index'
end

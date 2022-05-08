Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :amortizations
  resources :loans
  resources :clients

  root 'application#index'
  
    get 'about', to: 'application#about'
    get 'crear_loan', to: 'loans#crear_loan'

  get '*path', to: 'application#index'
end

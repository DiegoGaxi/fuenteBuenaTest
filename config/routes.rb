Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :amortizations
  resources :loans
  resources :clients

  root 'application#index'

    get 'getPrestamo/:principal/(:interes)/:plazo', to: 'loans#getPrestamo', :constraints => {:interes => /[^\/]+/}


    get 'getCliente', to: 'clients#getCliente'
    
    post 'guardarPrestamo', to: 'loans#guardarPrestamo'

    get '*path', to: 'application#index'
end

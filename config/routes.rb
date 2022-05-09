Rails.application.routes.draw do

  resources :clientes
  resources :amortizations
  resources :loans

  root 'application#index'

    get 'getPrestamo/:principal/(:interes)/:plazo', to: 'loans#getPrestamo', :constraints => {:interes => /[^\/]+/}

    get 'getClienteMongo', to: 'clientes#getClienteMongo'

    post 'guardarPrestamo', to: 'loans#guardarPrestamo'

    # Path general para cuando no escriben bien una ruta
    # get '*path', to: 'application#index'
end

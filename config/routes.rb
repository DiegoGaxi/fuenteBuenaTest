Rails.application.routes.draw do

  resources :clientes
  resources :amortizations
  resources :loans

  root 'application#index'

    # Obtener Un Cliente con su monto prestado
    get 'getClienteMongo', to: 'clientes#getClienteMongo'

    #  Obtener Un Prestamo con su amortizacion
    get 'getPrestamo/:principal/(:interes)/:plazo', to: 'loans#getPrestamo', :constraints => {:interes => /[^\/]+/}

    #  Guardar un prestamo asignado a un cliente
    post 'guardarPrestamo', to: 'loans#guardarPrestamo'
    
    # Para ver los clientes
    #   /clientes => clientes#show

    # Para ver los prestamos
    #   /loans => loans#show
    
    # Para ver las amortizaciones
    #   /amortizations => amortizations#show
    
    # Path general para cuando no escriben bien una ruta
    # get '*path', to: 'application#index'
end

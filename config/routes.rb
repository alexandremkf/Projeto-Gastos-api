Rails.application.routes.draw do
  # Rota para teste de vida da aplicação.
  get "up" => "rails/health#show", as: :rails_health_check

  # Rotas de usuários aqui:

    # Rota de usuário create (POST).
    resources :users, only: [:create]

    # Rota de usuário index (GET).
    resources :users, only: [:index]

    # Rota de usuário uptade (UPDATE).
    resources :users, only: [:update]
    
  # Rotas de gastos aqui:



  # Rota root (ainda comentada)
  # root "posts#index"
end

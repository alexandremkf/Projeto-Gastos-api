Rails.application.routes.draw do
  # Rota para teste de vida da aplicação.
  get "up" => "rails/health#show", as: :rails_health_check

  # Rotas para usuários e seus gastos.
  resources :users, only: [:create, :index, :update, :destroy] do
    resources :gastos
  end

  # Rota root (ainda comentada)
  # root "posts#index"
end

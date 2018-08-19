Rails.application.routes.draw do
  
  root to: 'home#index'
  get "checar/documento", to: "documentos#get"
  # Using Devise for authentication
  devise_for :users,
    path_names: {
      sign_in: 'login', sign_out: 'logout',
      password: 'senha', confirmation: 'confirmar',
      sign_up: 'registro'
    },
    controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords'
    }#,
    # skip: [:registrations]

  devise_scope :user do
    get "login", to: "users/sessions#new"
  end
  resources :documentos
  resources :papels
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :departamentos
  resources :orgaos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

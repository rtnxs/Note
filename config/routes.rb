Rails.application.routes.draw do
  root "notes#index"
  resources :notes#, only: %i[index show new create update destroy]
end

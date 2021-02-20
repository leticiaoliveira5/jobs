Rails.application.routes.draw do

  root 'home#index'

  devise_for :employees

  devise_for :applicants

  resources :companies, only: %i[index new create]

end

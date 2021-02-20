Rails.application.routes.draw do

  
  root 'home#index'

  devise_for :employees

  devise_for :candidates

  resources :companies, only: %i[index new create update edit show]

end

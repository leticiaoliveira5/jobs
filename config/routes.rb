Rails.application.routes.draw do

  
  root 'home#index'

  devise_for :employees, controllers: {registrations: "registrations"} 

  devise_for :candidates

  resources :companies, only: %i[index new create update edit show]

  resources :job_opportunities, only: %i[new create update edit show] do
    post 'create_job_application', on: :member
    member do
      post 'create_job_application'
    end
  end


end

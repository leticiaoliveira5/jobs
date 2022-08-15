Rails.application.routes.draw do
  root 'home#index'

  devise_for :employees, controllers: { registrations: 'registrations' }

  devise_for :candidates

  resources :companies, only: %i[index create update edit show]

  resources :job_opportunities, only: %i[index new create update edit show] do
    post 'create_job_application', on: :member
    member do
      post 'create_job_application'
      post 'inactivate_job_opportunity'
      post 'activate_job_opportunity'
    end
  end

  resources :candidates, only: %i[index]

  resources :job_applications, only: %i[destroy show] do
    post 'decline', on: :member
    resources :job_proposals, only: %i[new create show] do
      post 'accept', on: :member
      post 'reject', on: :member
    end
  end

  resources :resumes, only: %i[new update edit show]

  resources :search_results, only: %i[index]
end

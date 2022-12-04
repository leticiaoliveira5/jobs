Rails.application.routes.draw do
  root 'home#index'

  devise_for :employees, controllers: { registrations: 'registrations' }

  devise_for :candidates

  resources :companies, only: %i[index create update show]

  scope '/company' do
    get '/dashboard', to: 'companies#dashboard'
    get '/edit_info', to: 'companies#edit'
  end

  resources :job_opportunities, path: 'jobs', only: %i[index new create update edit show] do
    post 'create_job_application', on: :member
    member do
      post 'create_job_application'
      post 'inactivate_job_opportunity'
      post 'activate_job_opportunity'
    end
  end

  scope '/candidate' do
    get '/dashboard', to: 'candidates#dashboard'
  end

  resources :candidates, path: '/u', only: :show

  resources :job_applications, path: 'applications', only: %i[destroy show] do
    post 'decline', on: :member
    resources :job_proposals, path: 'proposals', only: %i[new create show] do
      post 'accept', on: :member
      post 'reject', on: :member
    end
  end

  resources :search_results, only: %i[index]

  resources :work_experiences, only: %i[create destroy]

  resources :candidate_skills, only: %i[create destroy]
end

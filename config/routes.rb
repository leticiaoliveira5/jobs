Rails.application.routes.draw do
  root 'home#index'

  devise_for :employees, controllers: { registrations: 'registrations' }

  devise_for :candidates

  resources :companies, only: %i[index create update edit show] do
    get 'employee_panel', on: :member
  end

  resources :job_opportunities, only: %i[index new create update edit show] do
    post 'create_job_application', on: :member
    member do
      post 'create_job_application'
      post 'inactivate_job_opportunity'
      post 'activate_job_opportunity'
    end
  end

  scope '/candidate' do
    get '/dashboard', to: 'candidates#dashboard'
    get '/resume', to: 'resumes#show'
    get '/edit_resume', to: 'resumes#edit'
    patch '/resume', to: 'resumes#update'
  end

  resources :job_applications, only: %i[destroy show] do
    post 'decline', on: :member
    resources :job_proposals, only: %i[new create show] do
      post 'accept', on: :member
      post 'reject', on: :member
    end
  end

  resources :search_results, only: %i[index]
end

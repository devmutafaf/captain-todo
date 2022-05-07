Rails.application.routes.draw do
  resources :tasks do
    resource :status, only: %i[update], controller: 'tasks/status'
  end
  resources :family_members#, only: %i[index new create show]

  root "family_members#index"
end

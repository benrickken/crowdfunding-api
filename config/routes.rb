require 'sidekiq/web'

Rails.application.routes.draw do
  Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end

  namespace :admin do
    resources :users, only: %i[index show update]
    resources :projects, only: %i[index]
    resources :project_uploads, only: %i[new create]
    resources :contacts, only: %i[new create]
  end

  namespace :api do
    namespace :v1 do
      resource :me, only: [:show] do
        collection do
          get :projects, :backed_projects, :notifications
          patch :read_notifications
        end
      end
      resources :users, only: [:create]
      resources :projects, only: %i[index show create] do
        resources :project_returns, only: [:index]
        resources :comments, only: %i[index create edit]
        resource :favorite, only: %i[show create destroy]
      end
      resources :project_supports, only: [:create]
    end
  end
end

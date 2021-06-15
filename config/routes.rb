Rails.application.routes.draw do
  namespace :admin do
    resources :projects, only: %i[index]
  end

  namespace :api do
    namespace :v1 do
      resource :me, only: [:show] do
        collection do
          get :projects, :backed_projects
        end
      end
      resources :users, only: [:create]
      resources :projects, only: %i[index show create] do
        member do
          resources :project_returns, only: [:index]
          resources :comments, only: [:index]
        end
      end
      resources :project_supports, only: [:create]
    end
  end
end

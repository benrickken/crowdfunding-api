Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        collection do
          get :me
        end
      end
      resources :projects, only: [:index, :show, :create]
    end
  end
end

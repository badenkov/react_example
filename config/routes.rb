Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :photos, only: [] do
        get :search, on: :collection
      end
    end
  end

  scope module: :web do
    root to: "welcome#index"
  end
end

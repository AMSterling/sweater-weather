Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :users, only: [:create]
      get :forecast, to: 'weather#forecast'
    end
  end
end

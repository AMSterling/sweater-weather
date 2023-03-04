Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :users, only: [:create]
      get :forecast, to: 'weather#forecast'
      get 'book-search', to: 'book#book_search'
    end
  end
end

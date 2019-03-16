Rails.application.routes.draw do
  scope '/api' do
    resources :users, only: :create
    resources :orders do
      member do
        post 'cancellation'
      end
    end

    resources :items do
      collection do
        get 'search'
      end

      member do
        post 'collection'
      end
    end

    resources :sessions, only: %i[create destroy]

    get 'profile', to: 'users#profile'
  end
end

Rails.application.routes.draw do
  scope '/api' do
    resources :users, only: :create
    resources :orders

    resources :items do
      collection do
        get 'search'
      end
    end

    resources :sessions, only: %i[create destroy]
  end
end

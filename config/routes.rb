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
        get  'search'
        post 'upload'
      end

      member do
        post   'collection'
        delete 'collection' => :cancel_collection
        get    'comments'
        post   'comments'   => :add_comment
      end
    end

    resources :sessions, only: %i[create destroy]

    resource :profile, controller: :profile do
      member do
        get 'collections'
        get 'items'
        get 'orders'
      end
    end
  end
end

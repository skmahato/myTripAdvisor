Rails.application.routes.draw do


  get  '/admin',      to: 'admins#index'
  get  '/admin/users',     to: 'users#index'
  get  '/admin/hotels',      to: 'hotels#index'
  get  '/admin/reviews',      to: 'reviews#index'
  get  '/admin/comments',      to: 'comments#index'
  get  '/admin/images',       to: 'images#index'

  root 'hotels#index'

  get  '/help',       to: 'home#help'
  get  '/about',      to: 'home#about'
  get  '/contact',    to: 'home#contact'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'auth/twitter/callback', to: 'sessions#omni'
  get 'auth/failure', to: redirect('/')

  resources :searches

  resources :emails

  resources :images do
    member do
      get :delete
    end
  end

  resources :users do
    member do
      get :delete
    end
  end

  resources :hotels do
    member do
      get :delete
    end
  end

  resources :reviews do
    member do
      get :delete
    end
  end

  resources :comments do
    member do
      get :delete
    end
  end

  resources :rooms do
    member do
      get :delete
    end
  end

  resources :bookings do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

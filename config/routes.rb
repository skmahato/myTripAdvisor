Rails.application.routes.draw do


  get  '/admin',      to: 'admins#index'


  root 'hotels#index'

  get  '/help',       to: 'home#help'
  get  '/about',      to: 'home#about'
  get  '/contact',    to: 'home#contact'
  get  '/admin/help',       to: 'admin/home#help'
  get  '/admin/about',      to: 'admin/home#about'
  get  '/admin/contact',    to: 'admin/home#contact'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'auth/twitter/callback', to: 'sessions#omni'
  get 'auth/failure', to: redirect('/')

  resources :searches, only: [:index] do
    member do
      get :search
    end
  end

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

  namespace :admin do
    resources :reviews, :comments, :hotels, :users, :images, :rooms, :searches, :emails, :bookings do
      member do
        get :delete
      end
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

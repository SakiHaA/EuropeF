Rails.application.routes.draw do
  devise_for :users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#new_guest"
    get "users", to: 'public/registrations#index'
  end

  namespace :admin do
    root to: "homes#top"
    get 'about' => 'homes#about'
    get 'search' => 'posts#search'
    resources :users,  only: [:index, :show, :edit, :update] do
      resources :comments, only: [:index]
      resources :favorites, only: [:index]
    end
    resources :leagues,  only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :teams, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :players, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :posts, only: [:index, :show ,:destroy] do
        resources :comments, only: [:destroy]
      end
    end
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'search' => 'posts#search'
    resources :users, only: [:show, :edit, :update, :destroy] do
      resources :comments, only: [:index]
      resources :favorites, only: [:index]
    end
    resources :leagues,  only: [:index, :show]
    resources :teams, only: [:index, :show]
    resources :players, only: [:index, :show] do
      resources :posts, only: [:index, :new, :create, :show, :destroy] do
        resources :comments, only: [:create, :destroy]
        resources :favorites, only: [:create, :destroy]
      end
    end
  end
end
Rails.application.routes.draw do
  #ユーザー用
  devise_for :users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#new_guest"
  end

  namespace :admin do
    root to: "homes#top"
    get 'about' => 'homes#about'
    resources :users,  only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :leagues,  only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :teams, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :players, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'search' => 'posts#search'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :leagues,  only: [:index, :show]
    resources :teams, only: [:index, :show]
    resources :players, only: [:index, :show] do
      resources :posts, only: [:index, :new, :create, :destroy, :show] do
        resources :comments, only: [:create, :destroy]
        resources :favorites, only: [:create, :destroy]
      end
    end
  end
end
Rails.application.routes.draw do
  #ユーザー用
  devise_for :users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: "homes#top"
    resources :users,  only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :leagues,  only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :teams, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :players, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :posts, only: [:create, :destroy]
    end
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :leagues,  only: [:index, :show]
    resources :teams, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :players, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :posts, only: [:create, :destroy]
    end
    get 'search' => 'posts#search'
  end



end

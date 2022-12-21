Rails.application.routes.draw do
  #ユーザー用
  devise_for :users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
  end

  namespace :admin do
    root to: "homes#top"
    resources :leagues,  only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :teams, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :players, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

end

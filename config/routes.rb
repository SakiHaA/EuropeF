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
    resources :players, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :users, only: [:show, :edit, :update, :destroy]
    #欧州5大リーグは5つしかないのでユーザーは追加、編集、削除不可
    resources :leagues,  only: [:index, :show]
    #チームと選手は100を超えるため、ユーザーも追加可能だが、悪用防止のため、編集と削除は不可
    resources :teams, only: [:index, :new, :create, :show]
    resources :players, only: [:index, :new, :create, :show]
  end
end
Rails.application.routes.draw do
  devise_for :admin, skip: [:passwords] ,controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  devise_scope :admin do
    post 'admin/guest_sign_in', to: 'admin/sessions#guest_sign_in'
    delete 'admin_logout' => 'admin/sessions#destroy', as: :logout_admin_session
  end

  namespace :admin do
    root to: 'homes#top'
    resources :quests, only: [:show, :edit, :create, :edit, :update, :destroy, :new]
    resources :members, only: [:index, :show, :edit, :update] do
      get :permission
      get :rejected
    end
    patch 'admin/exchange_requests/:id' => 'update#exchange_request'
    resources :reviews, only: [:new, :create]
    get    '/relationships/invitation_code', to: "relationships#invitation_code"
    resources :relationships,       only: [:new, :create]
  end

  devise_for :members, skip: [:passwords], controllers: {
    registrations: "member/registrations",
    sessions: 'member/sessions'
    #post 'homes/guest_sign_in', to 'homes#new_guest'
  }
  devise_scope :member do
    post 'member/guest_sign_in', to: 'member/sessions#guest_sign_in'
    delete 'member_logout' => 'member/sessions#destroy', as: :logout_member_session
  end

  scope module: 'member' do
    root to: 'homes#top'
    get '/mypage' => 'homes#mypage'
    get '/about' => 'homes#about'
    get '/exchange_requests' => 'quests#exchange_request'
    post '/exchange_requests' => 'quests#exchange_request_receive'
    get 'quests/histories' => 'quests#histories'
    get 'quests/complete/:id' => 'quests#complete', as: 'quests_complete'
    get 'quests/receive/:id' => 'quests#receive', as: 'quests_receive'
    delete 'giveup/:id' => 'quests#giveup', as: 'quests_giveup'
    resources :quests, only: [:show]
    resources :members, only: [:new, :create, :edit, :show, :update]
    resources :wallets, only: [:show, :update]
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end

Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root to: 'homes#top'
  resources :quests
  resources :members, only: [:index, :show, :edit, :update]
  patch 'admin/exchange_requests/:id' => 'update#exchange_request'
  resources :reviews, only: [:new, :create]
end




  devise_for :members, controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
}

scope module: 'member' do
  root to: 'homes#top'
  resources :quests, only: [:show, :update]
  get 'quests/receive' => 'quests#receive'
  resources :members, only: [:new, :create, :edit, :show, :update]
  resources :wallets, only: [:show, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


end

Rails.application.routes.draw do

  devise_for :users ,
  controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/sign_up/confirm', to: 'users/registrations#confirm'
    get 'users/sign_up/complete', to: 'users/registrations#complete'
  end

  root to: "contents#index"
  resources :contents ,only: [:new ,:create]
end

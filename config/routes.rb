Rails.application.routes.draw do
  devise_for :users
  resources :chat_rooms do
    post 'join', on: :member
    delete 'leave', on: :member
    resources :messages, only: [:create]
  end
  root "chat_rooms#index"
end

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  resources :events

  get '/sms/text_friend' => 'sms#text_friend'
  get '/sms/text_friend_once_home' => 'sms#text_friend_once_home'

  get 'events/show' => 'event#show' 

end

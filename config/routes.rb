Rails.application.routes.draw do
  resources :samples
  resources :paids
  resources :charges
  get "/bass" => "bass#index"
  get "/drums" => "drums#index"
  get "/effects" => "effects#index"
  get "/guitars" => "guitars#index"
  get "/synths" => "synths#index"
  get "/vocals" => "vocals#index"
  get "/members/:id" => "members#show"
  get "/users/payment_profile" => "users#payment_profile"
  get "/marketplaces" => "marketplaces#index"



get "settings/payment-info/users/auth/stripe_connect/callback", to:"users#stripe_callback"

  devise_for :users, :controllers => {:registrations => "registrations"}


  resources :samples do
    member do
      put "like", to: "samples#upvote"
      put "dislike", to: "samples#downvote"
    end
  end
  resources :paids do
    member do
      put "like", to: "paids#upvote"
      put "dislike", to: "paids#downvote"
    end
  end


  devise_scope :user do
  get 'login', to: 'devise/sessions#new'
  get 'signup', to: 'devise/registrations#new'

  authenticated  do
    root to: 'samples#index'
  end

  unauthenticated  do
    root to: 'devise/sessions#new'
  end

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

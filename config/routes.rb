Rails.application.routes.draw do
  resources :samples
  get "/bass" => "bass#index"
  get "/drums" => "drums#index"
  get "/effects" => "effects#index"
  get "/guitars" => "guitars#index"
  get "/synths" => "synths#index"
  get "/vocals" => "vocals#index"
  get "/users/:id" => "users#show"
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :samples do
    member do
      put "like", to: "samples#upvote"
      put "dislike", to: "samples#downvote"
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

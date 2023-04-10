Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :friendrequests do
      delete '/remove_user', to: "friendrequests#removefriend"
    end
    resources :posts do
      resources :comments
    end
  end
  root "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'details/index'
  devise_for :users
  get "/users", to: "details#index"
  root "details#index"
  resources :users do
    resources :friendrequests do
      delete '/remove_user', to: "friendrequests#removefriend"
    end
  end
end



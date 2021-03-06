Rails.application.routes.draw do


  root 'welcome#index'

  resources :articles do
    resources :comments
  end

  resources :welcome
  namespace :api do
    namespace :v1 do
      resources :register
      post "register/get_user"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

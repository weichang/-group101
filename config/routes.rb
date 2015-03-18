Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :groups do
      member do
        post :join
        post :quit
      end
    resources :posts
  end
  root 'groups#index'
 
  namespace :account do
  	resources :groups
  	resources :posts
  end

end

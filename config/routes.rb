Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :posts
  root "home#index"
  get 'home/about/(:name)', to: "home#about"
  get 'posts/comments_block_update/(:page)', to: "posts#comments_block_update"
  
  # devise_scope :user do
    # delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

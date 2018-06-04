Rails.application.routes.draw do
  resources :users
  resources :posts
  root "home#index"
  get 'home/about/(:name)', to: "home#about"
  get 'posts/comments_block_update/(:page)', to: "posts#comments_block_update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

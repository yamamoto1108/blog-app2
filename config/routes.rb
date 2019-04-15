Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  resources :tags, only: [:show]
  post "/like/:post_id" => "likes#like", as: 'like'
  delete "/like/:post_id" => "likes#unlike", as: 'unlike'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
end

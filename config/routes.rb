Rails.application.routes.draw do

  get '/' => 'products#index'

  resources :products do
    resources :reviews
  end
end

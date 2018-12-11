Rails.application.routes.draw do

  get '/' => 'products#index'

  resources :products do
    resources :reviews, except: [:index, :new, :show]
  end
end

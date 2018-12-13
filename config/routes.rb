Rails.application.routes.draw do

  get '/' => 'pages#landing'

  resources :products do
    resources :reviews, except: [:index, :new, :show]
  end

  resource :users
  resource :sessions

end

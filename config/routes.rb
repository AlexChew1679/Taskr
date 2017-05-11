Rails.application.routes.draw do

  devise_for :users
  root 'pages#home'
  get 'about' => 'pages#about'

  resources :tasks do
    member do
      put :change
    end
  end
  # 'about is just a name, if you put name as heyhey, then localhost:3000/heyhey will take you to pages#about '

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

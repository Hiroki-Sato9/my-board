Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'user/sessions'
  }
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  root "static_pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end

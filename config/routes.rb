Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }

  resources :boards

  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  root "static_pages#home"
end

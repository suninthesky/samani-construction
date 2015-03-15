Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  match 'projects', to: 'pages#projects', via: :get, as: 'projects'

  resources :projects

  mount Attachinary::Engine => "/attachinary"

end

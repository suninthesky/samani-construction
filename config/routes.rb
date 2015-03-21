Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  match 'projects', to: 'pages#projects', via: :get, as: 'projects'
  match 'contact', to: 'pages#contact', via: :get, as: 'contact'

  resources :projects

  mount Attachinary::Engine => "/attachinary"

end

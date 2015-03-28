Rails.application.routes.draw do

  devise_for :users
  
  root 'projects#index'

  get 'set_basket', to: 'projects#set_basket', as: 'set_basket'
  delete 'project_items/remove_style', as: 'remove_style'

  resources :projects
  resources :users
  resources :customers
  resources :inventory_styles
  resources :inventory_items
  resources :project_items, only: [:create, :destroy]
  resources :notes
  resources :attachments
  resources :emails

  namespace :api, :defaults => {:format => :json} do
  	resources :customers, :users, :projects, :inventory_items, :inventory_styles, :notes, :attachments
    resources :sessions, only: [:create]
    resources :item_info_with_serial, only: [:create]
  end

end

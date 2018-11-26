Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :docs

  # DEVISE 2
  # root index page for everyone that have already logged in ==> Docs Controller Index Action
  authenticated :user do
  	root "docs#index"
  end

  # root index page for everyone who has not logged in
  root 'welcome#index'


end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'posts', to: 'static_pages#index'
  get 'weblog', to: 'static_pages#index'
  get 'about', to: 'static_pages#about'
  get 'services', to: 'static_pages#services'
  root 'static_pages#index'

end

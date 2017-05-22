Rails.application.routes.draw do
  
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }, :path => "blog",
    :path_names => {
    :sign_in => 'login',
    :sign_out => 'logout',
    :password => 'secret',
    :confirmation => 'verification',
    :unlock => 'unblock',
    :registration => 'register',
    :sign_up => 'blog-with-yinka' }

  get 'hire', to: 'contacts#new'
  
  resources :contacts, only: [:new, :create], :path => "hire"

  resources :articles do
    resources :comments
  end

  get 'about', to: 'static_pages#about'
  get 'services', to: 'static_pages#services'


  root 'static_pages#index'


end

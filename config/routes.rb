Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  resources :pages do 
  	get "delete"
  end

  resources :features do 
  	get "detele"
  end

  #resources :smtp_server_settings

  get "/settings/smtp-server" => "smtp_server_settings#smtp_settings", as: :smtp_settings
  get ":slug" => "pages#show", as: :show_page

  scope "settings" do
    resources :configs, except: [:show]
    get "smtp" => "configs#smtp_configs", as: :smtp_configs
    get "smtp/new" => "configs#new_smtp_config", as: :new_smtp_config
    get "smtp/edit/:id" => "configs#edit_smtp_config", as: :edit_smtp_config
  end

  root to: "front#home"
   get "/dashboard" => "dashboard#index", as: :dashboard

  #get '/inquiry_form' => 'contact_email#inquiry', as: :inquiry_email
  #get "/properties/all" => "front#properties", as: :load_all_properties
  get "/profile/:login/edit" => "profile#edit", as: :user_profile
  get 'users/edit' => 'users/registrations#edit', as:  :edit_user_registration
  #get "search" => "properties#search", as: :search_properties
  get "/user/enable/:id" => "custom_users#get_enable", as: :get_enable_user_account
	post "/user/enable/:id" => "custom_users#post_enable", as: :post_enable_user_account
	get "/user/disable/:id" => "custom_users#get_disable", as: :get_disable_user_account
  post "/user/disable/:id" => "custom_users#post_disable", as: :post_disable_user_account
  

  get "/users"     => "custom_users#index", as: :all_users 
  get "/users/unregistered"     => "custom_users#unregistered", as: :unregistered_commission_percentage 
  post "/users/new"     => "custom_users#create", as: :create_user
  get "/users/new"     => "custom_users#new", as: :new_user
  get "/user/edit/:id" => "custom_users#edit", as: :edit_user
  patch "/user/update/:id" => "custom_users#update", as: :udapte_user
  delete "/user/destroy/:id" => "custom_users#destroy", as: :destroy_user
  get "/user/delete/:id" => "custom_users#delete", as: :delete_user

 
  
  scope "account" do 
    resources :profiles 
    get "profile/:uid" => "profiles#edit", as: :edit_account
  end
  #devise_for :users
  resources :permission_roles do 
    get "delete"
  end
  resources :permissions do 
    get "delete"
  end
  resources :roles do 
    get "delete"
  end

  devise_for :users, path: '', controllers: { 
    registrations: "users/registrations",
    confirmations: 'users/confirmations',
    passwords: "users/passwords",
    sessions: "users/sessions"
        
    }, 
    path_names: {
        sign_in: 'login', 
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'signup', 
        sign_up: '' 
  }

  devise_scope :user do
    #root to: "users/sessions#new"
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end
 
  # Dynamic error pages
  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unacceptable"
  get "/500", to: "errors#internal_error"
  #mount Ckeditor::Engine => '/ckeditor'
end

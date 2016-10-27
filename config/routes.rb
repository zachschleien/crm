Rails.application.routes.draw do

  root 'contacts#index'

  devise_for  :users, 
              :path => '', 
              :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
              :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
                               :registrations => 'registrations'
                              }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :contacts do
    resources :history, only: [:index]
      resources :conversations do
        member do
        patch :send_to_history
        patch :restore_conversation
      end
    end
  end
  
end

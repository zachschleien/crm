Rails.application.routes.draw do
  resources :contacts do
    resources :history, only: [:index]
      resources :conversations do
        member do
        patch :send_to_history
        patch :restore_conversation
      end
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'contacts#index'
end

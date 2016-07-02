Rails.application.routes.draw do

  resources :contacts do
    resources :conversations do
      member do
        patch :conversation_completed
      end
    end
  end 
  
  devise_for :users
  root 'contacts#index'
end

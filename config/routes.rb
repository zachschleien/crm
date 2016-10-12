Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :todo_lists do
  #     resources :todo_items do
  #       member do
  #         patch :complete
  #       end
  #     end
  #   end


  resources :contacts do
    resources :history, only: [:index]
      resources :conversations do
        member do
        patch :send_to_history
        patch :restore_conversation
      end
    end
  end

  devise_for :users
  root 'contacts#index'
  # get 'contacts/:id/history' => 'history#show'
  # put 'contacts/:id/history' => 'history#update', as: 'history'
  # # match "users/:id/downgrade" => "users#downgrade", :as => "downgrade_user", via: [:get, :post]

end

Rails.application.routes.draw do

  resources :contacts do
    resources :conversations do
    end
  end

  devise_for :users
  root 'contacts#index'
  get 'contacts/:id/history' => 'history#show', as: 'history', via: [:get, :post]
  # match "users/:id/downgrade" => "users#downgrade", :as => "downgrade_user", via: [:get, :post]
end

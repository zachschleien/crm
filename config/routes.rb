Rails.application.routes.draw do

  resources :contacts do
    resources :conversations do
    end
  end

  devise_for :users
  root 'contacts#index'
  get 'contacts/:id/history' => 'history#show'
end

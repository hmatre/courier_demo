Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'dashboard#index'
  resources :orders, :only => [:index,:new, :create, :show] do
    collection do
      get :track_courier_status
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

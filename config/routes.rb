Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  namespace 'api' do
    resources :welcome
  end

  resources :google_search_machine, only: [:index] do
  	collection do
  		post "/" => "google_search_machine#upload"
  	end
  end
end

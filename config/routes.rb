Rails.application.routes.draw do
	root to: 'tasks#index'

	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
	
	get 'signup', to: 'users#new'
	post 'signup', to: 'users#create'
	
	resources :users, only: [:index, :create]
	resources :tasks
end

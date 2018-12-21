Rails.application.routes.draw do
	root to: 'tasks#index'
	resources :tasks
	
	get 'login' => 'sessions#new'
	post 'login' => 'sessions#create'
	delete 'logout' => 'sessions#destroy'
	
	get 'signup' => 'users#new'
	resources :users, only: [:index, :show, :new, :create]
	
end

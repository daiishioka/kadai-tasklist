Rails.application.routes.draw do
  get 'taskposts/create'

  get 'taskposts/destroy'

	root to: 'tasks#index'
	resources :tasks
	
	get 'login' => 'sessions#new'
	post 'login' => 'sessions#create'
	delete 'logout' => 'sessions#destroy'
	
	get 'signup' => 'users#new'
	resources :users, only: [:index, :show, :new, :create]
	
	resources :taskposts, only: [:create, :destroy]
end

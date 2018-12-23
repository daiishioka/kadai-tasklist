# Rails.application.routes.draw do
#   get 'taskposts/create'

#   get 'taskposts/destroy'

# 	root to: 'tasks#index'
# 	resources :tasks
	
# 	get 'login' => 'sessions#new'
# 	post 'login' => 'sessions#create'
# 	delete 'logout' => 'sessions#destroy'
	
# 	get 'signup' => 'users#new'
# 	resources :users, only: [:index, :show, :new, :create]
	
# 	resources :taskposts, only: [:create, :destroy]
# end

Rails.application.routes.draw do
	root to: 'tasks#index'

	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
	
	get 'signup', to: 'users#new'
	post 'signup', to: 'users#create'
	
	resources :users
	
	resources :tasks
end

Rails.application.routes.draw do
  # get 'applications/create'
  # get 'applications/update'
  # get 'applications/show'

  resources :applications, only: [:create,:update,:show] do
  	resources :chats, only: [:create, :update, :index, :show]
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

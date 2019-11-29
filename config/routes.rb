Rails.application.routes.draw do
  get 'chats/create'
  get 'chats/update'
  get 'chats/show'
  get 'chats/index'
  # get 'applications/create'
  # get 'applications/update'
  # get 'applications/show'

  resources :applications, only: [:create,:update,:show] do
  	resources :chats, only: [:create, :update, :index, :show] do 
      resources :messages, only: [:create, :update, :index, :show]
    end
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

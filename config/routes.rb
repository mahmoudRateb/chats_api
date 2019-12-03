Rails.application.routes.draw do

  resources :applications, only: [:create,:update,:show] do
  	resources :chats, only: [:create, :update, :index, :show] do 
      resources :messages, only: [:create, :update, :index, :show] do
        collection { get :search }
      end
    end
  end 
  
end

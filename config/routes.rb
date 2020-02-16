Rails.application.routes.draw do
  

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'users/confirm' => "users#confirm"
  get "/books/:id" => "books#show"



  root 'welcome#index'

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
  }
  
  resources :boards , :only => [:show, :index, :new, :create, :edit, :update, :destroy] do
    resources :favorites, only: [:create, :destroy]
  end
  
  resources :board_messages, :only => [:create, :edit, :destroy, :update]
  
  resources :admins, :only => [:index]
  
  devise_scope :user do
    post "update", :to => "users/registrations#update"
    get "delete", :to => "users/registrations#delete"
    patch "complete", :to => "users/registrations#complete"
  end
  
  resources :users, only: [:show, :index] do
    member do
     get :likes
    end
  end
  
  
  resources :books, only: [:index, :show]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :inquiries, only: [:index, :create, :new] do
    resources :answers, only: [:new, :create]
  end
  
  post 'inquiry/confirm' => 'inquiries#confirm'   

  


   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

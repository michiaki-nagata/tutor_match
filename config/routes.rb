Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :teacher do
      resources :students, only: [:index, :show]
      resources :messages, only: [:index, :show]
      resources :comments, only: [:create]
      resources :managements, only: [:index, :show]
      resources :inquiries, only: [:new, :create, :index, :show]
  end
  
  namespace :student do
      resource :student, only: [:update]
      resources :teachers, only: [:index, :show]
      resources :messages, only: [:index, :show]
      resources :comments, only: [:create]
      resources :inquiries, only: [:new, :create, :index, :show]
  end
  
 
end

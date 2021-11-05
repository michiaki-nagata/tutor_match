Rails.application.routes.draw do
  devise_for :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :teacher do
      resource :profile
  end
  
  namespace :student do
      resource :profile
  end
end

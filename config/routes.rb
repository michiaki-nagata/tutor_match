Rails.application.routes.draw do
  devise_for :students, controllers: {
    confirmations: 'students/confirmations',
    registrations: 'students/registrations',
    mailer: 'students/mailer',
    sessions: 'students/sessions',
    shares: 'students/shared',
    unlocks: 'students/unlocks'
  }
  devise_for :teachers, controllers: {
    confirmations: 'teachers/confirmations',
    registrations: 'teachers/registrations',
    mailer: 'teachers/mailer',
    sessions: 'teachers/sessions',
    shares: 'teachers/shared',
    unlocks: 'teachers/unlocks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :teacher do
    resources :students, only: %i[index show]
    resources :messages, only: %i[index show create]
    resources :comments, only: [:create]
    resources :managements, only: [:index]
  end

  namespace :student do
    resources :student, only: %i[edit update]
    resources :teachers, only: %i[index show]
    resources :messages, only: %i[index show create]
    resources :comments, only: [:create]
  end
  
  resources :inquiries, only: %i[new create index show]

  root 'tops#top'
  get 'top', to: 'tops#top'
end

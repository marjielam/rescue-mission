Rails.application.routes.draw do
  resources :questions
  resources :answers, except: [:edit, :update]
end

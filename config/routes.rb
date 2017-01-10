Rails.application.routes.draw do
  resources :questions do
    resources :answers, except: [:edit, :update, :show]
  end
end

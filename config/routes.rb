Rails.application.routes.draw do




  resources :tests do
   resources :questions
     resources :results
end

  resources :answers


  devise_for :users
  devise_for :models
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'tests#index'

  # Example of regular route:
     get 'tests/:id/prepare' => 'tests#prepare_test'



end

Rails.application.routes.draw do

  get 'teacher/index'
  get 'teacher/:id/promote' => 'teacher#promote'
  get 'teacher/:id/downgrade' => 'teacher#downgrade'

  root 'tests#index'

  get 'sqlbox/index'

  resources :databases
  
  resources :tests do
   resources :questions
   resources :results
  end

  resources :answers
  devise_for :users
  devise_for :models

  get 'tests/:id/prepare' => 'tests#prepare_test'
  get 'mytest' => 'tests#me'
  get 'tests/:test_id/raport' => 'results#raport'
  get 'tests/:test_id/raportpdf' => 'results#raportpdf'
  get 'tests/:test_id/pdfdetails' => 'results#pdfdetails'
  

end

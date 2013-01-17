Xpence::Application.routes.draw do
  
  root :to => 'pages#welcome'

  resources :expenses do 
    get :autocomplete_employee_name, :on => :collection
  end

  resources :statements, :except => [:index] do 
    resources :expenses 
  end

  resources :employees do 
    resources :expenses 
  end

  get '/:employee_name/expenses(/:statement_id)' => 'expenses#index', :as => 'named_employee_expenses'

  match '/auth/google_apps/callback' => 'sessions#create', :as => 'signin'

  match '/auth/google_apps', :as => 'authorization'

  match '/signout' => 'sessions#destroy', :as => 'signout'

  get '/admin/dashboard' => 'admin#dashboard', :as => 'admin_dashboard'

  match '/expenses/:id/reset' => 'expenses#reset', :as => 'reset'

  match 'statements/:id/remind' => 'statements#remind', :as => 'statement_reminder'

end

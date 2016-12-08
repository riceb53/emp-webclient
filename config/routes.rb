Rails.application.routes.draw do
  get '/employees/new' => 'employees#new'
  get '/employees/:id' => 'employees#show'
  get '/employees' => 'employees#index'
  post '/employees' => 'employees#create'
  patch '/employees/:id' => 'employees#update'
  get '/employees/:id/edit' => 'employees#edit'
  delete '/employees/:id' => 'employees#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

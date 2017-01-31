Rails.application.routes.draw do

  get "/contacts", to: 'contacts#index'
  get "/contacts/new", to: 'contacts#new'

  get "/contacts/:id", to: 'contacts#show'
   post "/contacts/search", to: 'contacts#search'

  post "/contacts", to: 'contacts#create'

  get "/contacts/:id/edit", to: 'contacts#edit'

  patch "/contacts/:id", to: 'contacts#update'

  delete "/contacts/:id", to: 'contacts#destroy'
end

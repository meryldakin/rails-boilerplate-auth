Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login', to: "auth#create"
  post '/fetch_current_user', to: "auth#show"
end

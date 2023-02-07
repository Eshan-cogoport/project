Rails.application.routes.draw do
    get "/articles", to:"articles#read"
    get "/articles/:id", to:"articles#index"
    post "/articles", to:"articles#create"
    put "/articles/:id", to:"articles#update"
    delete "/articles/:id", to:"articles#delete"

    post "/categories", to:"categories#create"
    get "/categories", to:"categories#index"
    delete "/categories/:id", to:"categories#delete"

    resources :users
    post '/auth/login', to:'authentication#login'

end

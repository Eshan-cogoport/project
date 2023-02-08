Rails.application.routes.draw do
    # get "/articles", to:"articles#read"
    get "/articles", to:"articles#index"
    post "/articles", to:"articles#create"
    put "/articles/:id", to:"articles#update"
    delete "/articles/:id", to:"articles#delete"

    post "/categories", to:"categories#create"
    get "/categories/:id", to:"categories#index"
    get "/categories", to:"categories#read"
    # delete "/categories/:id", to:"categories#delete"
    put "/categories/:id", to:"categories#update"
    get "/categoryfilter", to:"categories#categoryFilter"

    # resources :users
    post '/auth/login', to:'authentication#login'
    post '/signup', to:'users#create'
    get '/profile', to:'users#show'
    get '/auth/user/:id', to:'users#create'
    get '/articles_list/:username', to:'users#list_articles'
    put '/users/:id', to:'users#update'
    get '/users', to:'users#index'
    delete '/users', to:'users#delete'
end

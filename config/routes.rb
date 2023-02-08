Rails.application.routes.draw do
    get "/articles", to:"articles#read"
    get "/articles/:id", to:"articles#index"
    post "/articles", to:"articles#create"
    put "/articles/:id", to:"articles#update"
    delete "/articles/:id", to:"articles#delete"

    post "/categories", to:"categories#create"
    get "/categories", to:"categories#index"
    # delete "/categories/:id", to:"categories#delete"
    put "/categories/:id", to:"categories#update"

    resources :users
    post '/auth/login', to:'authentication#login'
    post '/signup', to:'users#create'
    get '/auth/user/:id', to:'users#create'
    get '/articles_list/:username', to:'users#list_articles'
end

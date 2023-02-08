class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: [:create,:index,:list_articles]
    before_action :set_user, only: [:show, :destroy]

        #GET '/users'
        def index
            @users=User.all
            render json: @users, status: :ok 
        end

        #GET '/profile'
        def show
            render json: @current_user, status: :ok 
        end

        #GET '/articles_list/:username'
        def list_articles
            @users=User.find_by(username: params[:username])
            if @users.present?
                    render json: @users.articles
            else
                    render json: { errors: @current_user.errors.full_messages }, 
                    status: :unprocessable_entity 
            end
        end

        #POST '/signup'
        def create
            # @users=User.create(name: params[:name],username: params[:username],email: params[:email], password: params[:password])
            # render json: @users
            @user = User. new (user_params)
            if @user.save 
                render json: @user, status: :created
            else
            render json: { errors: @user.errors.full_messages }, 
            status: :unprocessable_entity 
            end
        end

        #PUT '/users/:id'
        def update
            @user=User.find(params[:id])
                if @user.id==@current_user.id
                    if(params[:name])
                    @user.update(name: params[:name])
                    end
                    if (params[:email])
                    @user.update(email: params[:email]) 
                    end   
                    if (params[:description])
                    @user.update(description: params[:description])
                    end
                    if (params[:username])
                    @user.update(username: params[:username])
                    end
                    render json: @user
            else
                render html: 'user does not exist'
            end

        end

        #DELETE '/users'
        def destroy
            @user.destroy
        end

        private
        def user_params 
            params.permit(:username, :email, :password,:name,:description)
        end

        def set_user
            @user = User.find(params [:id])
        end
    
end

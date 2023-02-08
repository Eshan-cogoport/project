class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: [:create,:index ,:list_articles]
    before_action :set_user, only: [:show, :destroy]

        def index
            @users=User.all
            render json: @users, status: :ok 
        end

        def show
            render json: @current_user, status: :ok 
        end

        def list_articles
            @articles=Article.find_by(params[:user_id])
            @users=User.find(@articles.user_id)
            @article_list=Article.joins(:user,:category).select("id","category_id","description","title","created_at","text","author","category_name","cover_url","user_id").where(user_id: @users.id)
            render json: @article_list, status: :ok
        end
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

        def update
            # @users=User.update(name: params[:name],username: params[:username],email: params[:email], password: params[:password])
            # render json: @users
            unless @user.update(user_params)
                render json: { errors: @user.errors.full_messages },
                status: :unprocessable_entity 
            end
        end

        def destroy
            @user.destroy
        end

        private
        def user_params 
            params.permit(:username, :email, :password,:name)
        end

        def set_user
            @user = User.find (params [:id])
        end
    
end

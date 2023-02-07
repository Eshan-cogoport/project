class ArticlesController < ApplicationController
    before_action :authenticate_request,except: [:read,:index,:update,:create]
    
    #GET /articles
    def read
        @articles=Article.joins(:category).select("id","category_id","title","created_at","text","author","category_name","cover_url","user_id")
        render json: @articles
    end
   
    #GET /articles/:id
    def index
        if params[:id]
            @articles=Article.find(params[:id])
        elsif params[:author]
            @articles=Article.where(author: params[:author])
        elsif params[:title]
            @articles=Article.where("title LIKE ?", "%#{params[:title]}%")
        elsif params[:date]
            @articles=Article.where("date BETWEEN ? AND ?",params[:date].split(",")[0],params[:date].split(",")[1])
        elsif
            @articles=Article.joins(:category).select("id","category_id","title","created_at","text","author","category_name","users_id")
        end
        render json: @articles
    end

    #POST /articles
    def create
        @categories=Category.find_by(id: params[:category_id])
        if @categories.present?
        @articles=Article.create(title: params[:title],text: params[:text],description: params[:description],author: params[:author],category_id: params[:category_id],cover_url: params[:cover_url],user_id: params[:user_id])
        render json: @articles
        elsif
            render html: 'Category does not exist. Add this category to create blog...'
        end
    end

    #PUT /articles/:id
    def update
        @articles=Article.find(params[:id])
        if @articles.present?
        @articles.update(title: params[:title],text: params[:text],author: params[:author],category_id: params[:category_id],cover_url: params[:cover_url],user_id: params[:user_id])
        render json: @articles
        elsif render html: 'article does not exist'
        end
    end

    #DELETE /articles/:id
    def delete
        @articles=Article.find_by(id: params[:id])
        if @articles.present?
            Article.destroy(params[:id])
            render html: 'deletion successfull'
        elsif
        render html: 'Article does not exist'
        end
    end
end

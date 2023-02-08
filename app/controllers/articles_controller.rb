class ArticlesController < ApplicationController
    before_action :authenticate_request,except: [:read,:index,:searchArticle]
    
    #GET /articles
    # def read
    #     @articles=Article.joins(:category,:user).select("id","category_id","author","name","description","title","created_at","text","name","category_name","cover_url","user_id")
    #     render json: @articles
    # end

    #GET /articles/:id
    def index
        if params[:id]
            @articles=Article.find(params[:id])
        elsif params[:author]
            @articles=Article.where("author LIKE ?", "#{params[:author]}%")
        elsif params[:title]
            @articles=Article.where("title LIKE ?", "%#{params[:title]}%")
        elsif params[:date]
            @articles=Article.where("date BETWEEN ? AND ?",params[:date].split(",")[0],params[:date].split(",")[1])
        elsif
            @articles=Article.joins(:category,:user).select("id","category_id","author","name","description","title","created_at","text","name","category_name","cover_url","user_id")
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
            if @articles.user_id==@current_user.id
                if(params[:title])
                @articles.update(title: params[:title])
                end
                if (params[:text])
                @articles.update(text: params[:text]) 
                end   
                if (params[:description])
                @articles.update(description: params[:description])
                end
                if (params[:cover_url])
                @articles.update(cover_url: params[:cover_url])
                end
            end
        render json: @articles
        else
             render html: 'article does not exist'
        end
    end

    #DELETE /articles/:id
    def delete
        @articles=Article.find_by(id: params[:id])
        if @articles.present?
            if @articles.user_id==@current_user.id
            Article.destroy(params[:id])
            render html: 'deletion successfull'
            else
            render html: 'you cannot delete posts of other users'
            end
        else
        render html: 'Article does not exist'
        end
    end

end

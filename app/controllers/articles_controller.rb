class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token

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
            @articles=Article.all
        end
        render json: @articles
    end

    def create
        @categories=Category.find_by(id: params[:id])
        if @categories.present?
        @articles=Article.create(title: params[:title],text: params[:text],author: params[:author],category_id: params[:id])
        render json: @articles
        elsif
            render html: 'Category does not exist. Add this category to create blog...'
        end
    end
    def update
        @articles=Article.find_by(id: params[:id])
        if @articles.present?
        @articles.update(title: params[:title],text: params[:text],author: params[:author],id: params[:id])
        render json: @articles
        elsif render html: 'article does not exist'
        end
    end

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

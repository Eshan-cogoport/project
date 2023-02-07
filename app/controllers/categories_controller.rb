class CategoriesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        if params[:id]
            @categories=Category.find(params[:id])
        elsif
            @categories=Category.all
        end
        render json: @categories

    end
    def create
        @categories=Category.find_by(id: params[:id])
        if @categories.present?
            render html: 'existing category. Enter a new category'
        elsif
        @categories=Category.create(category_name: params[:category_name])
        render json: @categories
        end
    end
    def delete
        @categories=Category.find_by(id: params[:id])
        if @categories.present?
            Category.destroy(params[:id])
            render html: 'deletion successfull'
        elsif
        render html: 'category does not exist'
        end
    end
end

class CategoriesController < ApplicationController
    before_action :authenticate_request,except: [:read,:index]

    def read
        @categories=Category.all
        render json: @categories
    end
    def index
        if params[:id]
            @categories=Category.find(params[:id])
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

    #DELETE CATEGORY
    # def delete
    #     @categories=Category.find_by(id: params[:id])
    #     if @categories.present?
    #         Category.destroy(params[:id])
    #         render html: 'deletion successfull'
    #     elsif
    #     render html: 'category does not exist'
    #     end
    # end
end
